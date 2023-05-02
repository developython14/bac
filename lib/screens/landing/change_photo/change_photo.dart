import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:mucap/models/constantes/const.dart';
import 'package:alert/alert.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mucap/providers/device/device_info.dart';
import 'package:provider/provider.dart';

class change_photo extends StatefulWidget {
  const change_photo({Key? key}) : super(key: key);

  @override
  State<change_photo> createState() => _change_photoState();
}

class _change_photoState extends State<change_photo> {
  File? cv;
  var __response;
  Future<void> change_profile() async {
    final url = Uri.parse(Base_url + 'put_account/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    var datatosend = {'id': context.read<device_infoproviderd>().user_id};
    request.fields.addAll(datatosend);

    request.headers.addAll(headers);
    try {
      final photo = http.MultipartFile.fromBytes(
          'image', await cv!.readAsBytes(),
          filename: cv!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {}
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    var jsonResponse = convert.jsonDecode(response.body);
    setState(() {
      __response = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff3A4750), title: Text('تغيير الصور')),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: hei * 0.4, bottom: hei * 0.05),
                child: GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Image.asset('assets/signup3.png'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => FutureProgressDialog(
                          change_profile(),
                          message: Text('Loading...')),
                    );
                    if (__response['mesage'] == 'updated succeffuly') {
                      Alert(message: 'succes').show();
                      context
                          .read<device_infoproviderd>()
                          .set_userdata(__response);
                    }
                  },
                  child: Text('تأكيد التعديل'))
            ],
          ),
        ));
  }
}
