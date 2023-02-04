// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final urlController = TextEditingController();
  var get_resp;
  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  get_video(TextEditingController urlController) async {
    var response = await http.post(
      Uri.parse("http://192.168.2.9:8000/api/get_tag"),
      body: {
        "url": urlController.text,
      },
    );
    // return response;
    if (response.statusCode == 200 || response.statusCode == 202) {
      var message = jsonDecode(response.body)['Success'];
      var snackBar = SnackBar(content: Text(message));
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
                print(urlController.text);
                get_resp = get_video(urlController);
                print(get_resp);
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
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Icon(Icons
                                            .arrow_back) // the arrow back icon
                                        ),
                                  ),
                                  title: const Center(
                                    child: Text(
                                      "Download",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Title : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
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
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Icon(Icons
                                            .arrow_back) // the arrow back icon
                                        ),
                                  ),
                                  title: const Center(
                                    child: Text(
                                      "Tags",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000)),
                  icon: const Icon(Icons.tag), //icon data for elevated button
                  label: const Text("Get Video Tags"), //label text
                )
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(
                                        Icons.arrow_back) // the arrow back icon
                                    ),
                              ),
                              title: const Center(
                                child: Text(
                                  "Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
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
