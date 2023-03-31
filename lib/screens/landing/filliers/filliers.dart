import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/Home/componanats/levels.dart';

class filliers extends StatelessWidget {
  const filliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          levels_componant(
            hei: hei,
            title: 'علوم تجريبية',
            color: Colors.green,
            abre: '3ass',
            path: '/modules',
          )
        ],
      )),
    ));
  }
}
