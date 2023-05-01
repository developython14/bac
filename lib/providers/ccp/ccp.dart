import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mucap/models/constantes/const.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Ccpproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String _status = 'idle';
  String _ccp_number = '42313412';
  List _list_ccp = [];
  int _id = 0;

  List get list_ccp => _list_ccp;
  String get status => _status;
  int get id => _id;
  Future<void> getallccp() async {
    _list_ccp = await getdata();
    _status = 'loaded';
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

Future<List> getdata() async {
  print('ccp image caled');
  var test = Uri.parse(Base_url + 'ccp_images');
  var response = await http.get(test);
  List articles = [];
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body)['results'];
    print(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      articles.add(jsonResponse[i]);
    }

    print(articles);
    return articles;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
