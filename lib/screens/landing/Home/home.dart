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
          levels_componant(hei: hei)
        ],
      ),
    ));
  }
}

class levels_componant extends StatelessWidget {
  const levels_componant({
    Key? key,
    required this.hei,
  }) : super(key: key);

  final double hei;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  left: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
              ),
              height: 50,
              child: Text(
                'السنة الثالثة ثانوي ',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
            ),
            height: 50,
            width: hei * 0.05,
            child: Center(
              child: Text('3AM'),
            ),
          ),
        ],
      ),
    );
  }
}
