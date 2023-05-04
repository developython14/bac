import 'package:flutter/material.dart';
import 'package:mucap/models/constantes/loader.dart';
import 'package:mucap/providers/ccp/ccp.dart';
import 'package:mucap/providers/contact/contact.dart';
import 'package:mucap/providers/content/content.dart';
import 'package:mucap/providers/stories/pubs.dart';
import 'package:mucap/providers/stories/stories.dart';
import 'package:provider/provider.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  get_data() async {
    await context.read<Storiesproviderd>().getallstories();
    await context.read<Pubsproviderd>().getallpubs();
    await context.read<contenetproviderd>().getallcontenet();
    await context.read<Ccpproviderd>().getallccp();
    await context.read<Contactsproviderd>().getallcontacts();
    Navigator.pushNamed(context, '/');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ColorLoader3(
        radius: 70,
        dotRadius: 30,
      ))),
    );
  }
}
