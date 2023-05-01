import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mucap/models/constantes/const.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class device_infoproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String __device_id = '';
  int _id = 0;

  String get device_id => __device_id;
  Future<void> set_device_id(id) async {
    __device_id = id;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
