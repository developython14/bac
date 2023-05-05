import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pod_player/pod_player.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl_url(type, data) async {
  String url = type + data;
  final Uri url_launcher = Uri.parse(url);
  if (!await launchUrl(url_launcher)) {
    throw 'Could not launch $url_launcher';
  }
}

class Cours extends StatefulWidget {
  const Cours({Key? key}) : super(key: key);

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  var link = 'https://storage.googleapis.com/bacdz/test.mp4';
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  late final PodPlayerController controller;

  bool isAutoplayEnabled = false;
  bool isPlaybackLoopEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    controller = PodPlayerController(playVideoFrom: PlayVideoFrom.network(link))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                PodVideoPlayer(controller: controller),
                ElevatedButton(
                    onPressed: () {
                      _launchUrl_url('',
                          'https://drive.google.com/file/d/1S_E555kO_lxv7ETzbSVAK17A_4SdV6bF/view');
                    },
                    child: Text('حمل ملف الملخص الشامل من هنا')),
                GestureDetector(
                    onTap: () {
                      print('dz');
                      setState(() {});
                    },
                    child: chaipte(headerStyle: _headerStyle)),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Main example pag
class chaipte extends StatefulWidget {
  const chaipte({
    Key? key,
    required TextStyle headerStyle,
  })  : _headerStyle = headerStyle,
        super(key: key);

  final TextStyle _headerStyle;

  @override
  State<chaipte> createState() => _chaipteState();
}

class _chaipteState extends State<chaipte> {
  var ref = ' ';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Accordion(
        paddingListBottom: 0,
        paddingListTop: 0,
        maxOpenSections: 1,
        headerBackgroundColorOpened: Colors.black54,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            onOpenSection: () {
              print('selected');
            },
            leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Colors.red,
            headerBackgroundColorOpened: Colors.black,
            header: Text('تعيين كمية المادة عن طريق قياس الناقلية',
                style: widget._headerStyle),
            content: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print('called fine');
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.play_circle_filled),
                      Text('درس شامل الجزء1')
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.play_circle_filled),
                    Text('درس شامل الجزء1')
                  ],
                ),
              ],
            ),
            contentHorizontalPadding: 1,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
        ],
      ),
    );
  }
} //__
