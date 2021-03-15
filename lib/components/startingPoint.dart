import 'package:LegoApp/components/startingWidget.dart';
import 'package:LegoApp/models/user.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartingPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: StartingWidget(),
      ),
    );
  }
}