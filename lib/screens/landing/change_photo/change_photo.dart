import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class change_photo extends StatelessWidget {
  const change_photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? cv;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff3A4750), title: Text('تغيير الصور')),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                  child: Column(children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Image.asset('assets/signup3.png'),
                )
              ]))
            ])));
  }
}
