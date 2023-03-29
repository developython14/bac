import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/Home/componanats/story.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    ));
  }
}
