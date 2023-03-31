import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = [
      Image.network(
          'https://th.bing.com/th/id/OIP.ejJwy93WhLu6uCZ32Y8pCAHaDH?pid=ImgDet&rs=1'),
    ];
    final hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: items,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
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
          levels_componant(
            hei: hei,
            title: 'السنة الثالثة ثانوي ',
            color: Color.fromARGB(255, 217, 72, 62),
            abre: '3as',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الثانية  ثانوي ',
            color: Color.fromARGB(255, 210, 227, 24),
            abre: '2as',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الأولى   ثانوي ',
            color: Color.fromARGB(255, 222, 46, 175),
            abre: '1as',
          )
        ],
      ),
    ));
  }
}

class levels_componant extends StatelessWidget {
  const levels_componant({
    Key? key,
    this.title = 'sala',
    this.color = Colors.red,
    this.abre = 'rem',
    required this.hei,
  }) : super(key: key);

  final double hei;
  final String title;
  final Color color;
  final String abre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 80,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            height: 80,
            width: hei * 0.075,
            child: Center(
              child: Text(
                abre,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
