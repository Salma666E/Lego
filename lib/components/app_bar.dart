import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/components/register.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget appBar(BuildContext context,
    {bool showBottom = false, List<Widget> tabs}) {
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
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
      Padding(
        padding: EdgeInsets.all(3),
        child: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.blue[900],
          onPressed: () {
            showBottomSheet();
          },
        ),
      ),
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
        ),
      ),
    ],
  );
}
