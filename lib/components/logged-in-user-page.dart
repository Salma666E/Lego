import 'package:LegoApp/components/MyBag.dart';
import 'package:LegoApp/components/WishList.dart';
import 'package:LegoApp/components/app_bar.dart';
import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var id = '';

class LoggedInUserPage extends StatefulWidget {
  @override
  _LoggedInUserPageState createState() => _LoggedInUserPageState();
}

class _LoggedInUserPageState extends State<LoggedInUserPage> {
  final AuthService auth = AuthService();
  var usernameGet;

  @override
  void initState() {
    super.initState();

    usernameGet = '';

    var firestoreInstance = Firestore.instance;

    auth.getPrefs('UserID').then((value) {
      id = value;

      firestoreInstance
          .collection('users')
          .document(id)
          .get()
          .then((DocumentSnapshot docsnap) {
        setState(() {
          usernameGet = docsnap.data["displayName"];
          usernameGet =
              "${usernameGet[0].toUpperCase()}${usernameGet.substring(1)}";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: new Padding(
          padding: EdgeInsets.all(8.0),
          child: new Center(
            child: new Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
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
                              "MY PROFILE",
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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 30),
                              child: Text(
                                "Hi ${usernameGet}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5, top: 20),
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 236, 236, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/myinfo.png',
                                height: 70,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBag()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 236, 236, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/truckTrial.png',
                                height: 70,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black, fontSize: 15),),
                      Text("My Bag", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black, fontSize: 15),),
                    ],)
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WishList()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 236, 236, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mywishlist.png',
                                height: 70,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.24,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 236, 236, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/lego.png',
                                height: 70,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("My Wishlist", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black, fontSize: 15),),
                      Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black, fontSize: 15),),
                    ],)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
