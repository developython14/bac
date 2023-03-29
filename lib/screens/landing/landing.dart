import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:mucap/screens/landing/Home/home.dart';
import 'package:mucap/screens/landing/comment/comment.dart';
import 'package:mucap/screens/landing/contact/contact.dart';
import 'package:mucap/screens/landing/payment/payment.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selected_index = 0;
  String host_image = '';

  List widgets = [
    Text('one'),
    contatc(),
    Home(),
    payment(),
    comments(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
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
              TabItem(icon: Icons.comment, title: 'آراء '),
            ],
            onTap: (int i) => setState(() {
              selected_index = i;
            }),
          ),
          body: widgets[selected_index],
        ),
      ),
    );
  }
}
