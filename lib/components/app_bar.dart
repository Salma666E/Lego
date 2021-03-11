import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget appBar(BuildContext context,
    {bool showBottom = false, List<Widget> tabs}) {
  return AppBar(
    bottom: showBottom
        ? TabBar(
            tabs: tabs,
            labelColor: Colors.black,
          )
        : null,
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu_rounded,
          color: Colors.blue,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    backgroundColor: Colors.white,
    title: Text(
      "Lego",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
      Center(
          child: GestureDetector(
        onTap: () {
          translator.setNewLanguage(
            context,
            newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
            remember: true,
            restart: true,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 10.0),
          child: Text(
            translator.translate('Language'),
            style: translator.currentLanguage != 'ar'
                ? TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.blue)
                : TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.blue),
          ),
        ),
      )),
    ],
  );
}
