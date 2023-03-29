import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:mucap/screens/landing/Home/home.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selected_index = 0;
  String host_image = '';

  List widgets = [
    Text('free'),
    Text('free'),
    Text('free'),
    Home(),
    Text('free'),
  ];
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
            TabItem(icon: Icons.person, title: 'حسابي'),
            TabItem(icon: Icons.contacts, title: 'اتصل بنا'),
            TabItem(icon: Icons.home, title: 'الرئيسية'),
            TabItem(icon: Icons.payment, title: 'طرق الدفع'),
            TabItem(icon: Icons.comment, title: 'آراء وتعليقات'),
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
