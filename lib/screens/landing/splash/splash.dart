import 'package:flutter/material.dart';
import 'package:mucap/models/constantes/loader.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ColorLoader3(
        radius: 70,
        dotRadius: 30,
      ))),
    );
  }
}
