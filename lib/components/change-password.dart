import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var id = '';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _showPassword = false;
  bool _confirmObscureText = false;
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var passwordGet;
  final AuthService auth = AuthService();

  var oldPass;
  var error;
  
  @override
  void initState() {
    super.initState();

    passwordGet = '';
    oldPass = '';
    error = '';

    var firestoreInstance = Firestore.instance;

    auth.getPrefs('UserID').then((value) {
      id = value;

      firestoreInstance
          .collection('users')
          .document(id)
          .get()
          .then((DocumentSnapshot docsnap) {
            setState(() {
              passwordGet = docsnap.data["password"];
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
                    "Change Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              //OLD PASSWORD
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 40, right: 13, left: 13, bottom: 15),
                    child: new Text(
                      "Old Password",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                width: 320,
                child: new TextFormField(
                  style: TextStyle(fontSize: 11),
                  //controller: passwordController,
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(3.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                      //hintText: " ••••••••",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: this._showPassword ? Colors.grey : Colors.blue,
                        ),
                        onPressed: () {
                          setState(
                              () => this._showPassword = !this._showPassword);
                        },
                      ),
                    ),
                  keyboardType: TextInputType.text,
                  obscureText: _showPassword,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) {
                    Pattern pattern =
                        r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                    RegExp regex = new RegExp(pattern);
                    if (password.isEmpty) {
                      return 'Password is required';
                    } else if (!regex.hasMatch(password))
                      return 'Password is invalid!';
                    //must be at least 8 characters long and contain an uppercase letter, a lowercase letter and a number.
                    else
                      return null;
                  },
                  onChanged: (oldPassword){
                    setState(() {
                      oldPass = oldPassword;
                    });
                  } ,
                ),
              ),
              //NEW PASSWORD
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 40, right: 13, left: 13, bottom: 15),
                    child: new Text(
                      "New Password",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                width: 320,
                child: new TextFormField(
                  style: TextStyle(fontSize: 11),
                  controller: passwordController,
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(3.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey)),
                      //hintText: " ••••••••",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: this._showPassword ? Colors.grey : Colors.blue,
                        ),
                        onPressed: () {
                          setState(
                              () => this._showPassword = !this._showPassword);
                        },
                      )),
                  keyboardType: TextInputType.text,
                  obscureText: _showPassword,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) {
                    Pattern pattern =
                        r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                    RegExp regex = new RegExp(pattern);
                    if (password.isEmpty) {
                      return 'Password is required';
                    } else if (!regex.hasMatch(password))
                      return 'Password is invalid!';
                    //must be at least 8 characters long and contain an uppercase letter, a lowercase letter and a number.
                    else
                      return null;
                  },
                  //onSaved: (password) => loginPassword = password),
                ),
              ),
              //CONFIRM PASSWORD
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 40, right: 13, left: 13, bottom: 15),
                    child: new Text(
                      "Confirm Password",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                width: 320,
                child: new TextFormField(
                  style: TextStyle(fontSize: 11),
                  controller: confirmPasswordController,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(3.0),
                    fillColor: Colors.white,
                    filled: true,
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                    //hintText: " ••••••••",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: this._confirmObscureText
                            ? Colors.grey
                            : Colors.blue,
                      ),
                      onPressed: () {
                        setState(() => this._confirmObscureText =
                            !this._confirmObscureText);
                      },
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: _confirmObscureText,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (confirmPassword) {
                    if (confirmPassword.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (confirmPassword != passwordController.text) {
                      return "The passwords don't match";
                    } else
                      return null;
                  },
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
              
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 20),
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
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        onPressed: () { 
                          if(passwordController.text.isEmpty || confirmPasswordController.text.isEmpty)
                          {
                            setState(() {
                              error = 'New Password field is empty!';
                            });
                            return null;
                          }
                          if(oldPass == passwordGet){
                            var firestoreInstance = Firestore.instance;

                          firestoreInstance
                              .collection('users')
                              .document(id)
                              .updateData({
                            "password": passwordController.text
                          }).then((value) => print("success"));
                          }
                          else{
                            setState(() {
                              error = "Old Password is wrong!";
                            });
                            return null;
                          }
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
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
