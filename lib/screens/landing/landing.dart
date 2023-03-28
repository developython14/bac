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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey,
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
            Text(
              'المستويات ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Container(
              color: Colors.green,
              child: const Material(
                child: ListTile(
                  title: Text(
                    'السنة الثالثة ثانوي ',
                    style: TextStyle(fontSize: 26),
                  ),
                  trailing: Text('fd'),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
