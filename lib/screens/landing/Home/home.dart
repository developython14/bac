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
          Text(
            'المستويات ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            color: Colors.green,
            child: const Material(
              child: ListTile(
                title: Text(
                  'السنة الثالثة ثانوي ',
                  style: TextStyle(fontSize: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('3AM'),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Material(
              child: ListTile(
                title: Text(
                  'السنة الثالثة ثانوي ',
                  style: TextStyle(fontSize: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('3AM'),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Material(
              child: ListTile(
                title: Text(
                  'السنة الثالثة ثانوي ',
                  style: TextStyle(fontSize: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('3AM'),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
