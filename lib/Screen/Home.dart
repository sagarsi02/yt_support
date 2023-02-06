// ignore_for_file: file_names, use_build_context_synchronously, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final urlController = TextEditingController();
  var get_resp;
  var tags;
  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  get_video(TextEditingController urlController) async {
    var response = await http.post(
      Uri.parse("http://192.168.133.72:8000/api/get_tag"),
      body: {
        "url": urlController.text,
      },
    );
    // return response;
    if (response.statusCode == 200 || response.statusCode == 202) {
      tags = jsonDecode(response.body)['Success'];
      var snackBar = const SnackBar(content: Text('Loading'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var message = jsonDecode(response.body)['Error'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yt support'),
        backgroundColor: const Color(0xFFFF0000),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: urlController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Paste Youtube Video Url',
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    return const TextStyle(
                        color: Color(0xFF150F0F), letterSpacing: 1.3);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                get_resp = get_video(urlController);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000)),
              icon: const Icon(Icons.search), //icon data for elevated button
              label: const Text("Get Video"), //label text
            ),
            const SizedBox(height: 100),
            // if
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('Download'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tags),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000)),
                  icon: const Icon(
                      Icons.download), //icon data for elevated button
                  label: const Text("Download Video"), //label text
                ),
                const SizedBox(width: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('Tags'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tags),
                          ),
                          actions: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(text: tags),
                                );
                                var snackBar =
                                    const SnackBar(content: Text('Copied'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF0000),
                              ),
                              icon: const Icon(Icons.copy),
                              label: const Text("Copy"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF0000),
                  ),
                  icon: const Icon(Icons.tag), //icon data for elevated button
                  label: const Text("Get Video Tags"), //label text
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: const Text('Login'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: const[
                              Text('Title : '),
                              Text('Description : '),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              // your code
                            })
                      ],
                    );
                    // return const AlertDialog(
                    //   scrollable: true,
                    //   title: Text('Details'),
                    //   content: Padding(
                    //     padding: EdgeInsets.all(8.0),
                    //     // child: Text('Title : '),
                    //     child: Form(
                    //       child: Column(
                    //         children: [

                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000)),
              icon: const Icon(Icons.info), //icon data for elevated button
              label: const Text("Title & Description"), //label text
            )
          ],
        ),
      ),
    );
  }
}
