import 'package:LegoApp/features/themes/about.dart';
import 'package:LegoApp/features/themes/products.dart';
// import 'package:LegoApp/components/drawerList.dart';
import 'package:flutter/material.dart';

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
    const Tab(text: 'About'),
    const Tab(text: 'Products'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Themes'),
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
