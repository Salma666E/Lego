import 'package:LegoApp/components/drawerList.dart';
import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'package:LegoApp/components/app_bar.dart';
import 'package:LegoApp/components/change-password.dart';
import 'package:LegoApp/services/auth.dart';
import '../components/edit_account.dart';

var id = '';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService auth = AuthService();
  String name;
  String email;
  String password;
  String month;
  String day;
  String year;
  String birthday;

  @override
  void initState() {
    super.initState();
    name = '';
    email = '';
    password = '';

    var firestoreInstance = Firestore.instance;

    auth.getPrefs('UserID').then((value) {
      id = value;

      firestoreInstance
          .collection('users')
          .document(id)
          .get()
          .then((DocumentSnapshot docsnap) {
        setState(() {
          print(docsnap.data["displayName"]);
          name = docsnap.data["displayName"];
          name = "${name[0].toUpperCase()}${name.substring(1)}";
        });
        setState(() {
          print(docsnap.data["email"]);
          email = docsnap.data["email"];
        });

        setState(() {
          month = docsnap.data["birthday"]["month"].toString();
          day = docsnap.data["birthday"]["day"].toString();
          year = docsnap.data["birthday"]["year"].toString();
          /*if (int.parse(month) < 10) {
            month = "0${docsnap.data["birthday"]["month"].toString()}";
          }
          if (int.parse(day) < 10) {
            day = "0${docsnap.data["birthday"]["day"].toString()}";
          }*/
          birthday = "${year}-${month}-${day}";
          print(birthday);
        });

        setState(() {
          password = docsnap.data["password"];
          print(password);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerList(),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: new Padding(
          padding: EdgeInsets.all(8.0),
          child: new Center(
            child: new Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 236, 236, 1),
                  ),
                  child: Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 6),
                            child: Text(
                              translator.translate("MYPROFILE"),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 1),
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 5),
                              child: Text(
                                "${translator.translate("Hi")} $name",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.blue[800],
                            disabledColor: Colors.blue[800],
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            child: Text(translator.translate("Home"),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 30),
                      child: Text(
                        translator.translate("Account"),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(236, 236, 236, 1),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 30),
                              child: Text(
                                translator.translate("Avatar"),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.all(13.0),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                border: new Border.all(color: Colors.grey),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                        //show username
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  translator.translate("Username"),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11, right: 11),
                          child: new TextFormField(
                            enabled: false,
                            style: TextStyle(fontSize: 12),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              hintText: name,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  translator.translate("Email"),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11, right: 11),
                          child: new TextFormField(
                            enabled: false,
                            style: TextStyle(fontSize: 12),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              hintText: email,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  translator.translate("DateOfBirth"),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11, right: 11),
                          child: new TextFormField(
                            enabled: false,
                            style: TextStyle(fontSize: 12),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              hintText: birthday,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: FlatButton(
                                            padding: EdgeInsets.zero,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditAccount(), //SingleCard(imgLink: widget.imgLink, post_details: widget.chosen_post)
                                                ),
                                              );
                                            },
                                            child: Text(
                                              translator.translate("EditAccount"),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  translator.translate("Password"),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11, right: 11),
                          child: new TextFormField(
                            enabled: false,
                            style: TextStyle(fontSize: 12),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              hintText: "********",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 8.0),
                                          child: FlatButton(
                                            padding: EdgeInsets.zero,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangePassword(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              translator.translate("ChangePassword"),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Divider(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.blue[800],
                              disabledColor: Colors.blue[800],
                              onPressed: () async {
                                await auth.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(translator.translate("Logout"),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> getPrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String getPrefsString = prefs.getString(key);
  print("AUTH GETTTTTTTTTTTTTTTTTTTTT " + getPrefsString);
  return getPrefsString;
}
