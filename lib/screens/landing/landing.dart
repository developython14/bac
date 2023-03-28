import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/componants/story.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
        bottomNavigationBar: ConvexAppBar(
          activeColor: Colors.black,
          color: Colors.black,
          backgroundColor: Colors.white,
          height: 56,
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'fre'),
            TabItem(icon: Icons.shopping_cart, title: 'free'),
            TabItem(icon: Icons.wechat, title: 'free'),
            TabItem(icon: Icons.settings, title: 'free'),
          ],
          onTap: (int i) => setState(() {
            selected_index = i;
          }),
        ),
        body: widgets[selected_index],
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('gtr')),
      ),
    );
  }
}

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
