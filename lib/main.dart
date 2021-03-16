// import 'dart:js';

import 'package:LegoApp/components/startingPoint.dart';
import 'package:LegoApp/features/home/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

main() async {
  // if your flutter > 1.7.8 :  ensure flutter activated
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/i18n/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  ); // intialize

  runApp(
    DevicePreview(
      builder: (context) => LocalizedApp(
        child: StartingPoint()/*Splash()*/,
      ),
      enabled: !kReleaseMode,
    ),
  );
}

// Widget DevicePreview({LocalizedApp Function(context) builder, bool enabled}) {}
