import 'package:LegoApp/components/forgot-password.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../components/register.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///////declarations and init state///////
  bool _showPassword = false;

  String error;
  String loginEmail = "";
  String loginPassword = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    error = "";
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 249, 250, 0.4),
      ///////appbar///////
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: new IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Home()));
        //   },
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/lego.png',
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 80),
              child: GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (context) => Home()));
                // },
                child: Text(
                  translator.translate("Account"),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(248, 249, 250, 0.8),
      ),
      ///////body///////
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
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: MediaQuery.of(context).size.height * 0.20,
                        decoration: BoxDecoration(
                          border: new Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/avatar.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ///////email address///////
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          translator.translate("Email"),
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(13),
                    child: new TextFormField(
                      style: TextStyle(fontSize: 10),
                      controller: emailController,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(3.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        hintText: translator.translate("Email"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (email) {
                        if (email.isEmpty) {
                          return translator.translate("EmailEmpty");
                        } else if (EmailValidator.validate(email) == true) {
                          return null;
                        } else {
                          return translator.translate("InvalidEmail");
                        }
                      },
                      onSaved: (email) => loginEmail = email,
                    ),
                  ),
                  ///////passwordd///////
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          translator.translate("Password"),
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(13),
                    child: TextFormField(
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
                          return translator.translate("PasswordRequired");
                        } else if (!regex.hasMatch(password))
                          return translator.translate("PasswordInvalid");
                        //must be at least 8 characters long and contain an uppercase letter, a lowercase letter and a number.
                        else
                          return null;
                      },
                      onSaved: (password) => loginPassword = password,
                    ),
                  ),

                  ///////log in error message///////
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  ///////log in button///////
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
                        color: Color.fromRGBO(0, 123, 255, 0.8),
                        disabledColor: Color.fromRGBO(0, 123, 255, 0.8),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            dynamic result =
                                await auth.signIn(loginEmail, loginPassword);

                            auth
                                .getPrefs('UserID')
                                .then((value) => print(value));

                            if (result == null) {
                              setState(() =>
                                  error = translator.translate("checkLogin"));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));
                            }
                          }
                        },
                        child: new Text(translator.translate("LogIn"),
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ),
                  ///////forgot password///////
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                          child: new Text(
                            translator.translate("ForgotPassword"),
                            style: TextStyle(
                                fontSize: 11,
                                color: Color.fromRGBO(0, 123, 255, 0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: new Text(
                          translator.translate("DontHaveAccount"),
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  ///////create account redirect///////
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: new Text(
                            translator.translate("CreateAccount"),
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 123, 255, 0.8)),
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
