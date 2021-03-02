import 'package:LegoApp/components/drawerList.dart';
import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: Center(
        child: Text('Themes'),
      ),
    );
  }
}
