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
          drawer: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Drawer(
              backgroundColor: Color(0xff3A4750),
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://th.bing.com/th?id=OIF.%2fzwSa5sbkHSYECwO3So00g&pid=ImgDet&rs=1'),
                        ),
                        Text(
                          'Mustapha belkassem',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            activeColor: Colors.black,
            color: Colors.black,
            backgroundColor: Colors.white,
            height: 56,
            style: TabStyle.react,
            items: [
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
