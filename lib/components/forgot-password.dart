import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ///////declarations and init state///////
  String email;
  String error;
  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();
  @override
  void initState() {
    super.initState();
    email = '';
    error = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 249, 250, 0.4),
      ///////app bar///////
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
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
          padding: EdgeInsets.all(1.0),
          child: new Center(
            child: Form(
              key: _formKey,
              child: new Column(
                children: [
                  ///////header///////
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translator.translate("recoverPass"),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ///////email address text field///////
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          translator.translate("Email"),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(11),
                    child: TextFormField(
                      style: TextStyle(fontSize: 10),
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(3.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        hintText: translator.translate("Email"),
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                      onChanged: (emailTXT) {
                        setState(() {
                          email = emailTXT;
                        });
                      },
                    ),
                  ),

                  ///////login button///////
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

                            dynamic result = auth.forgotPassword(email);

                            if (result == null) {
                              setState(() {
                                error = translator.translate("emailNotExist");
                              });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            }
                          }
                        },
                        child: new Text(translator.translate("Submit"),
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ),

                  ///////error message///////
                  //Padding(
                  //padding: EdgeInsets.only(top: 10, left: 15),child:
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                     error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  //),
                  ///////back to login button///////
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: new Text(
                            translator.translate("backLogin"),
                            style: TextStyle(
                                fontSize: 11,
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
