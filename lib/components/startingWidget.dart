import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/features/home/splash.dart';
import 'package:LegoApp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final userGet = Provider.of<User>(context);
    print(userGet);
    if(userGet == null)
    {
      return Login();
    }
    else{
      return Splash();
    }
  }
}