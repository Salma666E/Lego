import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var id = '';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  /*static final DateTime now = DateTime.now().;
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  var editFormat = formatted;*/

  final AuthService auth = AuthService();

  var usernameGet;

  var monthGet;

  var dayGet;

  var yearGet;

  var error = '';

  @override
  void initState() {
    super.initState();

    usernameGet = '';
    monthGet = '';
    dayGet = '';
    yearGet = '';

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

        print(id);
        print(usernameGet);

        setState(() {
          monthGet = docsnap.data["birthday"]["month"].toString();
          dayGet = docsnap.data["birthday"]["day"].toString();
          yearGet = docsnap.data["birthday"]["year"].toString();
          if (int.parse(monthGet) < 10) {
            monthGet = "0${docsnap.data["birthday"]["month"].toString()}";
          }
          if (int.parse(dayGet) < 10) {
            dayGet = "0${docsnap.data["birthday"]["day"].toString()}";
          }

          print(monthGet);
          print(dayGet);
          print(yearGet);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        body: SingleChildScrollView(
          child: new Center(
            child: new Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Avatar",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
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
                          image: AssetImage('assets/images/avatar.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(11.0),
                      child: new Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 13),
                  child: Container(
                    width: 320,
                    child: new TextFormField(
                      style: TextStyle(fontSize: 13),
                      //initialValue: usernameGet,
                      //controller: usernameGet,
                      decoration: new InputDecoration(
                        hintText: usernameGet,
                        contentPadding: EdgeInsets.all(3.0),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (newUsername) => {
                        setState(() {
                          usernameGet = newUsername;
                        })
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(11.0),
                      child: new Text(
                        "Date of birth",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Text(
                        "Month",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Text(
                        "Day",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Text(
                        "Year",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13, right: 13, bottom: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 102,
                        child: TextFormField(
                          maxLength: 2,
                          style: TextStyle(fontSize: 10),
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(3.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            hintText: monthGet,
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (month) {
                            if (int.parse(month) > 12 || int.parse(month) < 0) {
                              error = 'Please enter a number between 1 and 12';
                              return null;
                            } else {
                              return null;
                            }
                          },
                          onChanged: (newMonth) => {
                            setState(() {
                              monthGet = newMonth;
                            })
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        child: TextFormField(
                          maxLength: 2,
                          style: TextStyle(fontSize: 10),
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(3.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            hintText: dayGet,
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (day) {
                            if (int.parse(day) > 31 || int.parse(day) < 0) {
                              error = 'Please enter a number between 1 and 31';
                              return null;
                            } else {
                              return null;
                            }
                          },
                          onChanged: (newDay) => {
                            setState(() {
                              dayGet = newDay;
                            })
                          },
                        ),
                      ),
                      Container(
                        width: 102,
                        child: TextFormField(
                          maxLength: 4,
                          style: TextStyle(fontSize: 10),
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(3.0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            hintText: yearGet,
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (year) {
                            try {
                              int n = int.parse(year);
                              if (n > 2021 || n < 0) {
                                error = 'Invalid year';
                                return null;
                              } else {
                                return null;
                              }
                            } on FormatException {
                              return null;
                            }
                          },
                          onChanged: (newYear) => {
                            setState(() {
                              yearGet = newYear;
                            })
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          color: Color.fromRGBO(185, 177, 169, 1),
                          disabledColor: Color.fromRGBO(185, 177, 169, 1),
                          textColor: Colors.black,
                          disabledTextColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          var firestoreInstance = Firestore.instance;

                          firestoreInstance
                              .collection('users')
                              .document(id)
                              .updateData({
                            "displayName": usernameGet,
                            "birthday": {
                              "month": monthGet,
                              "day": dayGet,
                              "year": yearGet
                            }
                          }).then((value) => print("success"));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        color: Color.fromRGBO(18, 97, 160, 1),
                        disabledColor: Color.fromRGBO(18, 97, 160, 1),
                        textColor: Colors.white,
                        disabledTextColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
