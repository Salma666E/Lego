import 'package:LegoApp/components/app_bar.dart';
import 'package:LegoApp/components/drawerList.dart';
import 'package:LegoApp/features/themes/about.dart';
import 'package:LegoApp/features/themes/products.dart';
// import 'package:LegoApp/components/drawerList.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  final _kTabPages = <Widget>[
    About(),
    Products(),
  ];
  final _kTabs = <Tab>[
    Tab(
      text: translator.translate('TabAbout'),
    ),
    Tab(
      text: translator.translate('TabProducts'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        drawer: DrawerList(),
        appBar: appBar(context, showBottom: true, tabs: _kTabs),
        // appBar: AppBar(
        //   title: Text(translator.translate('Themes')),
        //   bottom: TabBar(
        //     tabs: _kTabs,
        //   ),
        // ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
