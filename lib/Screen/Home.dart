// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yt support'),
        backgroundColor: Color(0xFFFF0000),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Paste Youtube Video Url',
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    return TextStyle(
                        color: Color(0xFF150F0F), letterSpacing: 1.3);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF0000), fixedSize: const Size(200, 45)),
              onPressed: () {},
              child: const Text(
                'Enabled',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
