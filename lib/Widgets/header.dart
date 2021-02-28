import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget header() {
  return Center(
    child: SafeArea(
          child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image(
              image: AssetImage(
                  'assets/images/ExpressShipping-Home-202012-Sitewide-Banner.png'),
              height: 40,
            ),
          ),
          Container(
            width: 200.0,
            height: 48.0,
            child: Text(translator.translate('FreeHeader'),
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 80.0,
              height: 40.0,
              child: Text(translator.translate('LearnMore'),
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
