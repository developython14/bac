import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/componants/story.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('gtr')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            'Stories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton()
              ],
            ),
          ),
        ],
      )),
    );
  }
}
