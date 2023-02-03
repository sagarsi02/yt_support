// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class popUpModal extends StatefulWidget {
  const popUpModal(BuildContext context, {super.key});

  @override
  State<popUpModal> createState() => _popUpModalState();
}

class _popUpModalState extends State<popUpModal> {
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
    content: new Column(
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
    ),
  );
  }
}