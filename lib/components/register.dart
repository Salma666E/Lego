import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/auth.dart';
import './profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool _confirmObscureText = true;

  String _username = "";
  String _email = "";
  String _password = "";
  var _month = "";
  var _day = "";
  var _year = "";
  bool checkedValue = false;
  bool checked = true;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  final yearController = TextEditingController();

  clearTextInput() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    monthController.clear();
    dayController.clear();
    yearController.clear();
  }

  String error = '';

  final _formKey = GlobalKey<FormState>();

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 5,
        fontSize: 16.0);
  }

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 249, 250, 0.4),
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/lego.png',
              height: 35,
              width: 35,
            ),
            Padding(
              padding: EdgeInsets.only(right: 80),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text(
                  'Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(248, 249, 250, 0.8),
      ),
      body: SingleChildScrollView(
        child: new Padding(
          padding: EdgeInsets.all(8.0),
          child: new Center(
            child: Form(
              key: _formKey,
              child: new Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Create User Account",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 300,
                        child: Text(
                          "We just need a few pieces of information for your LEGO Account.",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  //USERNAME
                  Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Username",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Container(
                      width: 320,
                      child: new TextFormField(
                        style: TextStyle(fontSize: 10),
                        controller: usernameController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(3.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey)),
                          hintText: "Username",
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (username) {
                          if (username.isEmpty) {
                            return 'Username should not be empty!';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (username) => _username = username,
                      ),
                    ),
                  ),
                  //EMAIL
                  Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Email Address",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Container(
                      width: 320,
                      child: new TextFormField(
                        style: TextStyle(fontSize: 10),
                        controller: emailController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(3.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey)),
                          hintText: "Email Address",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          if (email.isEmpty) {
                            return 'Email should not be empty';
                          } else if (EmailValidator.validate(email) == true) {
                            return null;
                          } else {
                            return "Invalid email address";
                          }
                        },
                        onSaved: (email) => _email = email,
                      ),
                    ),
                  ),
                  //DATE OF BIRTH
                  Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Date of Birth",
                          style: TextStyle(fontSize: 9),
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
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: new Text(
                          "Day",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: new Text(
                          "Year",
                          style: TextStyle(fontSize: 9),
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
                            controller: monthController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.grey)),
                              hintText: "MM",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            onSaved: (month) => _month = month,
                          ),
                        ),
                        Container(
                          width: 100,
                          child: TextFormField(
                            maxLength: 2,
                            style: TextStyle(fontSize: 10),
                            controller: dayController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.grey)),
                              hintText: "DD",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            onSaved: (day) => _day = day,
                          ),
                        ),
                        Container(
                          width: 102,
                          child: TextFormField(
                            maxLength: 4,
                            style: TextStyle(fontSize: 10),
                            controller: yearController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(3.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.grey)),
                              hintText: "YY",
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            onSaved: (year) => _year = year,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //PASSWORD
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Password",
                          style: TextStyle(fontSize: 9),
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
                          hintText: " ••••••••",
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  this._obscureText ? Colors.grey : Colors.blue,
                            ),
                            onPressed: () {
                              setState(
                                  () => this._obscureText = !this._obscureText);
                            },
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) {
                        Pattern pattern =
                            r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                        RegExp regex = new RegExp(pattern);
                        if (password.isEmpty) {
                          return 'Password is required';
                        } else if (!regex.hasMatch(password))
                          return 'Invalid password';
                        else
                          return null;
                      },
                      onSaved: (password) => _password = password,
                    ),
                  ),
                  //CONFIRM PASSWORD
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Confirm Password",
                          style: TextStyle(fontSize: 9),
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
                          hintText: " ••••••••",
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
                          )),
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
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: CheckboxListTile(
                      title: Text(
                        "Accept Terms and Conditions",
                        style: TextStyle(
                            fontSize: 9,
                            color: Color.fromRGBO(0, 123, 255, 0.8)),
                      ),
                      activeColor: Colors.black,
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  /*SizedBox(height: 12.0, child:
                   Row (
                     children: [
                    Text(
                    "Please accept terms and conditions!",
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  ],),),*/

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        width: 300,
                        child: Text(
                          "When you agree to the Terms and Conditions you also consent to our use of your personal information to process and operate your LEGO Account. To see how to control your personal data, please see our privace policy.",
                          style: TextStyle(fontSize: 7, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(25.0),
                        child: new Row(
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text("Next",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              onPressed: () async {
                                if (checkedValue == false) {
                                  setState(() => error =
                                      "Please check the Terms and Conditions");
                                }
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  dynamic result = await auth.register(
                                      _email,
                                      _password,
                                      _username,
                                      _month,
                                      _day,
                                      _year,
                                      checkedValue);
                                  //dynamic resultdata = await auth.getData();
                                  /*if (result == null) {
                                    setState(() =>
                                       error="Please enter a valid information");
                                  } else {
                                    setState(() =>
                                        error = "Register was successful");
                                    print(result);*/
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }
                              },
                              color: Color.fromRGBO(0, 123, 255, 0.8),
                              disabledColor: Color.fromRGBO(0, 123, 255, 0.8),
                              textColor: Colors.white,
                              disabledTextColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 55, right: 55),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  /*SizedBox(height: 3.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 10.0),
                  ),*/
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: new Text(
                          "Already have a LEGO Account?",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 123, 255, 0.8)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Reg.PNG'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
