import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

String videoUrlLandscape =
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
String videoUrlPortrait =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
String longVideo =
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

String video720 =
    "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";

String video480 =
    "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4";

String video240 =
    "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings();

  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    src: longVideo,
  );

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      longVideo,
    )..initialize().then((value) => setState(() {}));
    _videoPlayerController2 = VideoPlayerController.network(video240);
    _videoPlayerController3 = VideoPlayerController.network(video480);
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        "240p": _videoPlayerController2,
        "480p": _videoPlayerController3,
        "720p": _videoPlayerController,
      },
    );

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Appinio Video Player"),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            kIsWeb
                ? Expanded(
                    child: CustomVideoPlayerWeb(
                      customVideoPlayerWebController:
                          _customVideoPlayerWebController,
                    ),
                  )
                : CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController,
                  ),
            CupertinoButton(
              child: const Text("Play Fullscreen"),
              onPressed: () {
                if (kIsWeb) {
                  _customVideoPlayerWebController.setFullscreen(true);
                  _customVideoPlayerWebController.play();
                } else {
                  _customVideoPlayerController.setFullscreen(true);
                  _customVideoPlayerController.videoPlayerController.play();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Cours extends StatefulWidget {
  const Cours({Key? key}) : super(key: key);

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings();
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      longVideo,
    )..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('حمل ملف الملخص الشامل من هنا')),
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
class chaipte extends StatelessWidget {
  const chaipte({
    Key? key,
    required TextStyle headerStyle,
  })  : _headerStyle = headerStyle,
        super(key: key);

  final TextStyle _headerStyle;

  @override
  Widget build(BuildContext context) {
    return Accordion(
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
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: Colors.red,
          headerBackgroundColorOpened: Colors.black,
          header: Text('تعيين كمية المادة عن طريق قياس الناقلية',
              style: _headerStyle),
          content: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.play_circle_filled),
                  Text('درس شامل الجزء1')
                ],
              ),
              Row(
                children: [
                  Icon(Icons.play_circle_filled),
                  Text('درس شامل الجزء1')
                ],
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
    );
  }
} //__
