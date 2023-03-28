import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/componants/story.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:mucap/screens/landing/home.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selected_index = 0;
  String host_image = '';

  List widgets = [Text('free'), Text('free'), Text('free'), Home()];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: widgets[selected_index],
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('gtr')),
      ),
    );
  }
}
