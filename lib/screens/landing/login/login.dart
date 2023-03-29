import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = 'Choose Role';
  String password = 'Choose Role';
  String message = 'Choose Role';
  String baseurl = 'https://rightservices.herokuapp.com';
  Future<void> signup() async {
    final datatosend = {
      'email': email,
      'password': password,
    };
    final url = Uri.parse(baseurl + '/admin/login/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll(datatosend);
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    var jsonResponse = convert.jsonDecode(response.body);
    if (jsonResponse['message'] == 'login succesfly') {}
    setState(() {
      message = jsonResponse['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/login.png'),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Text(
                    'ضع معلوماتك',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextField(
                            onChanged: ((value) {
                              email = value;
                            }),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              enabledBorder:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              hintText: 'اسم المستخدم',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextField(
                            onChanged: ((value) {
                              password = value;
                              print(password);
                            }),
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                hintText: 'كلمة المرور ',
                                hintStyle: TextStyle()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 202, 198, 181))),
                          onPressed: () async {
                            print(message);
                            if (message == 'login succesfly') {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'حساب جديد',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
