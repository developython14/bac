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
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  late final PodPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
          'https://ff9b2efa41270a582ab007bc0f4d604dd663f57f4fb2762f8797504-apidata.googleusercontent.com/download/storage/v1/b/bacdz/o/test.mp4?jk=ARTXCFHbxybPFr24aNys2GlIfoTGBXXCJZMsHuSgYt29lkPVgIju6tvfI4amTLHRUOGaql3oV5XSZIPxsLMBa-a3qKB4oLORGP3ZYbFewRaSO-JfbdHb4FS6BRrclvmqGOHORSp_uxSaVVE_fJLsdBuebpYKBpV8lDNcaTNZNdT-NSXaGjhbbR4IIXyZMVpvC1PeQZtMN7GESRd8QLxD_jZqp0zGmvH0ZPkqKAKN13ON7IV8kcLjshtIPdDf2XO9Ks8_71HxsaFqFr6kROKYQy7zE--Ofq8CI2SEkE1XIaxSTE4rijC4bNiG2HwFo5dcygJfuRK4eobBJzGhbPPes_HzyDxDqKu3Pw7ipmdjuidPTGh7o4Shf4aWlqSHyLfjhDU2hIHKu9MlIzDyl4AF03v6h8EgixmXQhkybHeXKRp2XBOmCG6tuCCCawV5pZDrqx_an5KVlrpe25fEYUdw5fEoQrD0o6UZvmJ9Oeen82-w_DiAzPrD8zHSJ7FjYrJPSgLNY9L9TiZIor3yZMSu3Sg19yHZEin3LT2ybjmLXYkWU9VsYthOXLlYifHI1yT42qGmvoS07KFcPe8FX3ZvO4Td33yklAzBg3jQM5P0xNXsGJMwUY5WngYDj4H-Fkppt0hfUiouWvYr-wJkUAejU3_E5M6ZfWeUaAyTkfzwzok_4McDZzQB-kzSttQZRV6IQd5kwvx7Ss9X3WrQTLP1VV9SyHJ45zVXlGDEG2K7eGLe5FLPOloA7AVPO9v0DE4Oqdn1RzrQexnuwwGPiMBpK6R2zycBDfCemmh_Pa4_eSjgjsShIdYRTnvz6sjWptm4NrtSNbz6HGOCd0YpalruEnk648SYWmysp7OzmUcV6xwLznJjBlrCIFy6wplCD1_6MUw4j-q9ec8zwbgrq4HP1efNKkSLNHyH8qXUsXRolN0bS4o6_2zxlV238Flc4aP65rc5R8toQeBCKNCEz_BJYb8bCBRHn3V5Ki9UVA2s5Jxt7OE4CEOH38B6UBdPJcKxaThPdwOpMzlnjyqZN0fJN82rZE5Sl-HjBjS_zRaVLfbB-awR0hZJc5WxTswjT-jemqag09A77xLWUVVV_H7sgs0b4JgWCWpS8Vx1lgMqe3Azdd-rLJizMRTZtb_Ay4uce2ndUETtU1BoST2WdJuAwZ3yhxBlHRQ5_2H-R3tR6-XPxV8&isca=1'),
    )..initialise();
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
