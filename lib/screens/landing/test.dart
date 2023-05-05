import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class data_ref extends StatefulWidget {
  const data_ref({super.key});

  @override
  State<data_ref> createState() => _data_refState();
}

class _data_refState extends State<data_ref> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: []),
    );
  }
}
