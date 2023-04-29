import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Storiesproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  List _list_stories = [];
  List __services_signup_mog = [];

  List get list_stories => _list_stories;
  void changecategories(id, name) {
    notifyListeners();
  }

  Future<void> getallarticles() async {
    var ref = await getdata(__services_signup_mog);
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

getdata(ref) async {
  var test = Uri.parse('base_url' + '/admin/list_services');
  var response = await http.get(test);
  List articles = [];
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    for (var i = 0; i < jsonResponse.length; i++) {
      articles.add(jsonResponse[i]);
      ref.add(
          jsonResponse[i]['_id'], jsonResponse[i]['ar'], jsonResponse[i]['en']);
    }
    return articles;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
