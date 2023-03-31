import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/modules/componant/module.dart';

class modules extends StatelessWidget {
  const modules({Key? key}) : super(key: key);

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
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                ),
                module_componant(
                  hei: hei,
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                ),
                module_componant(
                  hei: hei,
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                )
              ],
            ),
          ),
        )),
      )),
    );
  }
}
