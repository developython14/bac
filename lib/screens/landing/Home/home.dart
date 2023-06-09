import 'package:flutter/material.dart';
import 'package:mucap/providers/ccp/ccp.dart';
import 'package:mucap/providers/content/content.dart';
import 'package:mucap/providers/stories/pubs.dart';
import 'package:mucap/providers/stories/stories.dart';
import 'package:mucap/screens/landing/Home/componanats/levels.dart';
import 'package:mucap/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl_web(url) async {
  final Uri website = Uri.parse(url);
  if (!await launchUrl(website)) {
    throw 'Could not launch $website';
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = context
        .watch<Pubsproviderd>()
        .list_pubs
        .map(
          (e) => GestureDetector(
            onTap: () {
              _launchUrl_web(e['url']);
            },
            child: Image.network(
                'https://storage.googleapis.com/bacdz/' + e['image_de_garde']),
          ),
        )
        .toList();

    final hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: context.watch<Storiesproviderd>().status == 'loaded'
                  ? context
                      .watch<Storiesproviderd>()
                      .list_stories
                      .map((e) => storybutton(
                            title: e['title'],
                            cover_image: e['page_de_garde'] == ''
                                ? e['files'][0]
                                : 'https://storage.googleapis.com/bacdz/' +
                                    e['page_de_garde'],
                            id: e['id'],
                          ))
                      .toList()
                  : [Text('Loading ...')],
            ),
          ),
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
          levels_componant(
            hei: hei,
            title: 'السنة الثالثة ثانوي ',
            color: Color.fromARGB(255, 217, 72, 62),
            abre: '3as',
            path: '/filieres',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الثانية  ثانوي ',
            color: Color.fromARGB(255, 210, 227, 24),
            abre: '2as',
            path: '/filieres',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الأولى   ثانوي ',
            color: Color.fromARGB(255, 222, 46, 175),
            abre: '1as',
            path: '/filieres',
          )
        ],
      ),
    ));
  }
}
