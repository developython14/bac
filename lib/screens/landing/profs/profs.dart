import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/modules/componant/module.dart';

class profs extends StatelessWidget {
  const profs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                module_componant(
                  hei: hei,
                  title: 'الاستاذ مصطفى بلقاسم',
                  abre:
                      'https://2as.ency-education.com/uploads/1/0/9/0/1090282/icon-new-english_orig.png',
                  path: '/cours',
                ),
                module_componant(
                  hei: hei,
                  title: 'الاستاذ بلال يحياوي',
                  abre:
                      'blob:https://web.telegram.org/dc999c9f-cb24-4651-b3c3-3e4c893644b8',
                  path: '/cours',
                ),
              ],
            ),
          ),
        )),
      )),
    );
  }
}
