import 'package:flutter/material.dart';
import 'package:mucap/screens/landing/Home/componanats/story.dart';
import 'package:mucap/screens/landing/change_photo/change_photo.dart';
import 'package:mucap/screens/landing/faq/faq.dart';
import 'package:mucap/screens/landing/landing.dart';
import 'package:mucap/screens/landing/login/login.dart';
import 'package:mucap/screens/landing/signup/signup.dart';
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var ref = 0;
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future<void> initPlatformState() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  void initState() {
    PalTrustedDevice.check(
      emulator: true,
      devMode: false,
      onExtStorage: false,
      rooted: false,
      onFail: () {
        setState(() {
          ref = ref + 1;
        });
        // Not Secure Env Detected
      },
    );
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    if (_deviceData['bootloader'] == 'unknown') {
      setState(() {
        ref = ref + 1;
      });
    }
    if (_deviceData['isPhysicalDevice'] == false) {
      setState(() {
        ref = ref + 1;
      });
    }
    if (_deviceData['systemFeatures']
            .contains('android.hardware.sensor.proximity') ==
        false) {
      setState(() {
        ref = ref + 1;
      });
    }
    return ref > 0
        ? Center(
            child: Text('sorry not run on virtuel machine'),
          )
        : MaterialApp(
            title: 'HackElbac',
            theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
                textTheme: GoogleFonts.cairoTextTheme(
                  Theme.of(context).textTheme,
                )),
            initialRoute: '/',
            routes: {
              '/': (context) => Landing(),
              '/stories': (context) => MoreStories(),
              '/login': (context) => MyLogin(),
              '/signup': (context) => MyRegister(),
              '/filieres': (context) => MyRegister(),
              '/modules': (context) => MyRegister(),
              '/profs': (context) => MyRegister(),
              '/cours': (context) => MyRegister(),
              '/faq': (context) => faq(),
              '/change_photo': (context) => change_photo(),
            },
          );
  }
}

// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

