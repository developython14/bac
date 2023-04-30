import 'package:flutter/material.dart';
import 'package:mucap/providers/contact/contact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

Future<void> _launchUrl_url(type, data) async {
  String url = type + data;
  final Uri url_launcher = Uri.parse(url);
  if (!await launchUrl(url_launcher)) {
    throw 'Could not launch $url_launcher';
  }
}

class contatc extends StatelessWidget {
  const contatc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<Contactsproviderd>().status == 'idle') {
      context.watch<Contactsproviderd>().getallcontacts();
    }
    List ref = context.watch<Contactsproviderd>().list_contacts;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3A4750),
          title: Text(
            ' اتصل بنا',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ref
                    .map((e) => contact_tile(
                          id: e['id'].toString(),
                          key: ValueKey(e['created']),
                          title: e['title'],
                          icon: e['icon_title'],
                          url_to_show: e['text_to_show'],
                          url_type: e['type_url'],
                          url: e['url'],
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}

class contact_tile extends StatefulWidget {
  contact_tile({
    this.id = '',
    this.title = '',
    this.icon = '',
    this.url_to_show = '',
    this.url_type = '',
    this.url = '',
    super.key,
  });
  String id;
  String title;
  String icon;
  String url_to_show;
  String url_type;
  String url;

  @override
  State<contact_tile> createState() => _contact_tileState();
}

class _contact_tileState extends State<contact_tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Card(
              child: ListTile(
            onTap: () {
              _launchUrl_url(widget.url_type, widget.url);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.icon),
            ),
            title: Text(widget.url_to_show),
          )),
        ],
      ),
    );
  }
}
