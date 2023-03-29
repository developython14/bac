import 'package:flutter/material.dart';

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('يمكنك الدفع باستخدام Baridi Mob'),
              Card(
                  child: ListTile(
                onTap: () {},
                leading: Icon(Icons.facebook_outlined),
                title: Text('00799999001486730070'),
              )),
              Text('أو عبر البريد ccp'),
              Card(
                  child: ListTile(
                onTap: () {},
                leading: Icon(Icons.facebook_outlined),
                title: Text('001486730070'),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
