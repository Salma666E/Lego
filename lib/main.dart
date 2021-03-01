import 'package:LegoApp/features/home/splash.dart';
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

  runApp(LocalizedApp(child: Splash()));
}