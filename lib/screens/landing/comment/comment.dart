import 'package:flutter/material.dart';

class comments extends StatelessWidget {
  const comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var toma = [2, 2, 2, 2, 2];
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Text('free');
        },
        itemCount: toma.length,
      ),
    );
  }
}
