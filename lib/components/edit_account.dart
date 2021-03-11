import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var id = '';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final AuthService auth = AuthService();

  var usernameGet = '';
  var usernameSet = '';

  var monthGet = '';
  var monthSet = '';

  var dayGet = '';
  var daySet = '';

  var yearGet = '';
  var yearSet = '';

  @override
  void initState() {
    super.initState();
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
                      onSaved: (newUsername) => usernameSet = newUsername,
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
                            if (month.isEmpty) {
                              return 'Required';
                            } else if (int.parse(month) > 12 ||
                                int.parse(month) < 0) {
                              return 'Please enter a number between 1 and 12';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (month) => monthSet = month,
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
                            if (day.isEmpty) {
                              return 'Required';
                            } else if (int.parse(day) > 31 ||
                                int.parse(day) < 0) {
                              return 'Please enter a number between 1 and 31';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (day) => daySet = day,
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
                            if (year.isEmpty) {
                              return 'Required';
                            } else if (int.parse(year) > 2021 ||
                                int.parse(year) < 0) {
                              return 'Invalid year';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (year) => yearSet = year,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: null,
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
                        onPressed: null,
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
