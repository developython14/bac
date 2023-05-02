import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mucap/models/constantes/const.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class device_infoproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String __device_id = '';
  String _user_id = '';
  String __user_image = '';
  String _user_name = '';

  int _id = 0;

  String get device_id => __device_id;
  String get username => _user_name;
  String get user_id => _user_id;

  Future<void> set_device_id(id) async {
    __device_id = id;
    notifyListeners();
  }

  Future<void> set_userdata(response) async {
    print('called');
    print(response);
    _user_id = response['user_id'].toString();
    _user_name = response['username'];
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
