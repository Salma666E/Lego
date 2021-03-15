import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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

  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();

  var usernameGet;

  var monthGet;

  var dayGet;

  var yearGet;

  DateTime selectedDate = DateTime.now();

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

        setState(() {
          monthGet = docsnap.data["birthday"]["month"].toString();
          dayGet = docsnap.data["birthday"]["day"].toString();
          yearGet = docsnap.data["birthday"]["year"].toString();
          /*if (int.parse(monthGet) < 10) {
            monthGet = "0${docsnap.data["birthday"]["month"].toString()}";
          }
          if (int.parse(dayGet) < 10) {
            dayGet = "0${docsnap.data["birthday"]["day"].toString()}";
          }*/
        });
      });
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1930),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        monthGet = selectedDate.toString().substring(5, 7);
        dayGet = selectedDate.toString().substring(8, 10);
        yearGet = selectedDate.toString().substring(0, 4);
      });
    }
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
                      translator.translate("EditAccount"),
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
                        translator.translate("Avatar"),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(13.0),
                            child: new Text(
                              translator.translate("Username"),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 13),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(13.0),
                            child: new Text(
                              translator.translate("DateOfBirth"),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
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
                              "${translator.translate("DateOfBirth")}: $yearGet - $monthGet - $dayGet",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.white38,
                            disabledColor: Colors.white38,
                            onPressed: () => _selectDate(context),
                            child: new Text(
                              translator.translate("ChooseDate"),
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 2.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.white38,
                            disabledColor: Colors.white24,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                              );
                            },
                            child: Text(
                              translator.translate("Cancel"),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color.fromRGBO(18, 97, 160, 1),
                            disabledColor: Color.fromRGBO(18, 97, 160, 1),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
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
                              }
                            },
                            child: Text(
                              translator.translate("Save"),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
