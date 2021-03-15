import 'package:LegoApp/components/edit_account.dart';
import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
                    translator.translate("ChangePassword"),
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
                      translator.translate("OldPassword"),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right:13, top:13),
                child: new TextFormField(
                  style: TextStyle(fontSize: 11),
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
                      return translator.translate("PasswordRequired");
                    } else if (!regex.hasMatch(password))
                      return translator.translate("PasswordInvalid");
                    //must be at least 8 characters long and contain an uppercase letter, a lowercase letter and a number.
                    else
                      return null;
                  },
                  onChanged: (oldPassword) {
                    setState(() {
                      oldPass = oldPassword;
                    });
                  },
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
                      translator.translate("NewPassword"),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right:13, top:13),
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
                      return translator.translate("PasswordRequired");
                    } else if (!regex.hasMatch(password))
                      return translator.translate("PasswordInvalid");
                    //must be at least 8 characters long and contain an uppercase letter, a lowercase letter and a number.
                    else
                      return null;
                  },
                onChanged: (password) => passwordController.text = password
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
                      translator.translate("ConfirmPassword"),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right:13, top:13),
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
                      return translator.translate("ConfirmRequired");
                    }
                    if (confirmPassword != passwordController.text) {
                      return translator.translate("NotMatching");
                    } else
                      return null;
                  },
                  onChanged: (password) => confirmPasswordController.text = password
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 15.0),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 2.0),
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
                      style: TextStyle(fontSize: 12, color: Colors.black),
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
                      if (passwordController.text.isEmpty ||
                          confirmPasswordController.text.isEmpty) {
                        setState(() {
                          error = translator.translate("newPassEmpty");
                        });
                        return null;
                      }
                      if (oldPass == passwordGet) {
                        var firestoreInstance = Firestore.instance;

                        firestoreInstance
                            .collection('users')
                            .document(id)
                            .updateData({
                          "password": passwordController.text
                        }).then((value) => print("success"));
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAccount(),
                              ),
                            );
                      } else {
                        setState(() {
                          error = translator.translate("oldPassWrong");
                        });
                        return null;
                      }
                    },
                    child: Text(
                      translator.translate("Save"),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
