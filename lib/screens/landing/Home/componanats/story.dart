import 'package:flutter/material.dart';

class storybutton extends StatelessWidget {
  const storybutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.all(2),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromARGB(255, 255, 17, 0), width: 4),
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
                  fit: BoxFit.cover),
              // button text
            )),
        onTap: () {
          print("you clicked me");
        });
  }
}
