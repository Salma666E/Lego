import 'dart:async';
import 'package:LegoApp/components/drawerList.dart';
import 'package:LegoApp/components/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isDarkTheme = false;
  bool showSpinner;
  @override
  void initState() {
    super.initState();
    showSpinner = true;

    Timer(Duration(seconds: 3), () {
      setState(() {
        showSpinner = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    DrawerList();
    if (showSpinner == false)
      child = Register(
        isDarkTheme: isDarkTheme,
        onThemeChanged: (bool val) => setState(() => isDarkTheme = val),
      );
    else if (showSpinner == true) {
      child = SpinKitFadingCircle(
        color: Colors.black,
        size: 120.0,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: child,
          ),
        ),
      ),
      //Dark Theme
      debugShowCheckedModeBanner: false,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      //Language
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
    );
  }
}
