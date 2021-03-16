import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../services/auth.dart';

class Register extends StatefulWidget {
  const Register({
    this.isDarkTheme = false,
    this.onThemeChanged = _dummyOnFocusChange,
  }) : assert(onThemeChanged != null);

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;
  static dynamic _dummyOnFocusChange(bool val) {}
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ///////declarations and init state///////
  bool isDarkTheme = false;

  bool _obscureText = true;
  bool _confirmObscureText = true;

  String _username = "";
  String _email = "";
  String _password = "";
  var _month;
  var _day;
  var _year;
  bool checkedValue;
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

  String error;
  String checkedError;

  final _formKey = GlobalKey<FormState>();

  final AuthService auth = AuthService();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    error = '';
    checkedError = "";
    checkedValue = false;

    _month = "";
    _day = "";
    _year = "";
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

        _month = selectedDate.toString().substring(5, 7);
        _day = selectedDate.toString().substring(8, 10);
        _year = selectedDate.toString().substring(0, 4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 249, 250, 0.4),
      ///////app bar///////
      appBar: AppBar(
        // leading: new IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.black,
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Home()));
        //   },
        // ),
        automaticallyImplyLeading: false,
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
                  translator.translate('Account'),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(248, 249, 250, 0.8),
      ),
      ///////boy///////
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
                          translator.translate("CreateAccount"),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          translator.translate("WeNeedInfo"),
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  ///////username///////
                  Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          translator.translate("Username"),
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
                      controller: usernameController,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(3.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        hintText: translator.translate("Username"),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (username) {
                        if (username.isEmpty) {
                          return translator.translate("UsernameEmpty");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (username) => _username = username,
                    ),
                  ),

                  ///////email address///////
                  Row(
                    children: [
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        if (email.isEmpty) {
                          return translator.translate("EmailEmpty");
                        } else if (EmailValidator.validate(email) == true) {
                          return null;
                        } else {
                          return translator.translate("InvalidEmail");
                        }
                      },
                      onSaved: (email) => _email = email,
                    ),
                  ),
                  ///////date of birth///////
                  Row(
                    children: [
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          translator.translate("DateOfBirth"),
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
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
                          "${translator.translate("DateOfBirth")} : $_year - $_month - $_day",
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
                        horizontal: 8.0, vertical: 15.0),
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
                  ///////date of birth error message///////
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: SizedBox(
                      height: 15.0,
                      child: Row(
                        children: [
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ///////password///////
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
                    padding: EdgeInsets.all(11),
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
                          return translator.translate("PasswordRequired");
                        } else if (!regex.hasMatch(password))
                          return translator.translate("PasswordInvalid");
                        else
                          return null;
                      },
                      onSaved: (password) => _password = password,
                    ),
                  ),
                  ///////confirm password///////
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(
                            top: 13, right: 13, left: 13, bottom: 5),
                        child: new Text(
                          translator.translate("ConfirmPassword"),
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(11),
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
                          return translator.translate("ConfirmRequired");
                        }
                        if (confirmPassword != passwordController.text) {
                          return translator.translate("NotMatching");
                        } else
                          return null;
                      },
                    ),
                  ),
                  ///////terms and conditions///////
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: CheckboxListTile(
                      title: Text(
                        translator.translate("AcceptTerms"),
                        style: TextStyle(
                            fontSize: 11,
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
                  ///////terms and conditions error message///////
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: SizedBox(
                      height: 15.0,
                      child: Row(
                        children: [
                          Text(
                            checkedError,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(11),
                    child: Flexible(
                      child: Text(
                        translator.translate("WhenAgree"),
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ),
                  ),
                  ///////register button///////
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

                            if ((_month == '' && _year == '' && _day == '') ||
                                checkedValue == false) {
                              if (_month == '' && _year == '' && _day == '') {
                                setState(() {
                                  error = translator.translate("PickBD");
                                });
                              }

                              if (checkedValue == false) {
                                setState(() {
                                  checkedError =
                                      translator.translate("CheckTerms");
                                });
                              }
                            } else {
                              await auth.register(_email, _password, _username,
                                  _month, _day, _year, checkedValue);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }
                          }
                        },
                        child: new Text(translator.translate("Next"),
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ),
                  ///////login redirect///////
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          //color: Color.fromRGBO(18, 97, 160, 1),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: new Text(
                            translator.translate("AlreadyAccount"),
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 123, 255, 0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Reg.PNG'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new FloatingActionButton(
                      elevation: 0.0,
                      child: new IconButton(
                        icon: widget.isDarkTheme
                            ? Transform.rotate(
                                angle: .55,
                                child: Icon(
                                  Icons.brightness_3,
                                  size: 20.0,
                                ))
                            : Icon(Icons.brightness_7),
                        onPressed: () {
                          widget.onThemeChanged(!widget.isDarkTheme);
                          print("widget.isDarkTheme: " +
                              widget.isDarkTheme.toString());
                        },
                        tooltip: 'Switch brightness',
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
