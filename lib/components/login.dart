import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:flutter/material.dart';
import '../components/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

var id;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = false;

  String error = '';
  String loginEmail = "";
  String loginPassword = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    /*getPrefs('UserID').then((value) =>
      id = value
    );*/
    id = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 249, 250, 0.4),
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
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
                  new Row(
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
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  //Email
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          "Email",
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
                          hintText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (email) {
                          if (email.isEmpty) {
                            return 'Email Address should not be empty!';
                          } else if (EmailValidator.validate(email) == true) {
                            return null;
                          } else {
                            return "Email address is invalid!";
                          }
                        },
                        onSaved: (email) => loginEmail = email,
                      ),
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
                                color: this._showPassword
                                    ? Colors.grey
                                    : Colors.blue,
                              ),
                              onPressed: () {
                                setState(() =>
                                    this._showPassword = !this._showPassword);
                              },
                            )),
                        keyboardType: TextInputType.text,
                        obscureText: _showPassword,
                        textInputAction: TextInputAction.done,
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
                        onSaved: (password) => loginPassword = password),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(25.0),
                        child: new Row(
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text("Log in",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              color: Color.fromRGBO(0, 123, 255, 0.8),
                              disabledColor: Color.fromRGBO(0, 123, 255, 0.8),
                              textColor: Colors.white,
                              disabledTextColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 55, right: 55),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  dynamic result = await auth.signIn(
                                      loginEmail, loginPassword);

                                  auth.getPrefs('UserID').then((value) => print(value));

                                  
                                  if (result == null) {
                                    setState(() => error =
                                        "Please check your email and passsword!");
                                  } else {
                                    setState(
                                        () => error = "Login was successful");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Profile(),
                                        ));
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  /*SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )*/
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 19),
                        child: new Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color.fromRGBO(0, 123, 255, 0.8)),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: new Text(
                          "Don't have a LEGO Account?",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Register(), //SingleCard(imgLink: widget.imgLink, post_details: widget.chosen_post)
                            ),
                          );
                        },
                        child: new Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 123, 255, 0.8)),
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

/*Future<void> setPref(dynamic getid) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("UserID", getid);
   //print("SET PREFFFFFFFFFFFFFFFFFFFFFFFS"+ getPrefs());
 }*/

 Future<String> getPrefs(String key) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String getPrefsString = prefs.getString(key);
   print("AUTH GETTTTTTTTTTTTTTTTTTTTT " + getPrefsString);
   return getPrefsString;
 }

