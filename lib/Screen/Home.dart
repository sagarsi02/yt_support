// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:yt_support/Screen/Modal.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final urlController = TextEditingController();
  var tags = 'Tags';
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    urlController.dispose();
    super.dispose();
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
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000)),
              icon: const Icon(Icons.search), //icon data for elevated button
              label: const Text("Get Video"), //label text
            ),
            const SizedBox(height: 100),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => popUpModal(context),
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
                      builder: (BuildContext context) => popUpModal(context),
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
                AlertDialog(
                  content:  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                    const Text(
                      "Title : ", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text(
                      "Connect the TextEditingController to a text field", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => print('object'), 
                            style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF0000)
                                  ),
                                  icon: const Icon(Icons.download),  //icon data for elevated button
                                  label: const Text("Download"),
                          ),
                        ],
                      ),
                    ),
                    ],
                  )
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
