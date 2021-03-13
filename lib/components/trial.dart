import 'package:LegoApp/components/logged-in-user-page.dart';
import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/components/register.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:flutter/material.dart';

var id = '';

class Trial extends StatefulWidget {
  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  final AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();

    auth.getPrefs('UserID').then((value) {
      id = value;
    });
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 400.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "ACCOUNT",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close_rounded),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/lego.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          "Sign In to your LEGO Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new RaisedButton(
                                  child: new Text("Sign in",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  textColor: Colors.black,
                                  disabledTextColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 55, right: 55),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void showLoggedInBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 400.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "ACCOUNT",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close_rounded),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new RaisedButton(
                                  child: new Text("Profile",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                  textColor: Colors.black,
                                  disabledTextColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 55, right: 55),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Profile(),
                                        ));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 30),
                      child: RaisedButton(
                        child: Text("Logout",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        onPressed: () {
                          auth.signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        color: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }

  void returnBottomSheet() {
    if (id != null) {
      return showBottomSheet();
    } else {
      return showLoggedInBottomSheet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
