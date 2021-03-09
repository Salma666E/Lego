import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
/*import 'dart:math';
import 'package:random_string/random_string.dart';*/

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;

  /*//returns a User class if the user is signed in, or null if they are not
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });*/

  //create user obj based on Firebase User
  /*User userFromFirebaseUser (User user){
    return user != null ? User(uid: user.uid, displayName: user.displayName, email: user.email, password: user.password, month: user.month, day: user.day, year: user.year, termsCheck: user.termsCheck) : null;
  } */
  User userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid /*, displayName: user.displayName, email: user.email*/)
        : null;
  }

  Stream<User> get user {
    return auth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  Future setData(String uid, String email, String password, String displayName, String month, String day, String year, bool termsCheck) async{
    var randomDoc = firestoreInstance.collection('users').document();
    firestoreInstance
          .collection('users')
          .document(randomDoc.documentID)
          .setData(
            {
              "uid" : randomDoc.documentID,
              "email": email,
              "password" : password,
              "displayName" : displayName,
              "birthday":{
                "month" : month,
                "day": day,
                "year" : year
              },
              "termsandconditionscheck" : termsCheck,
              "isAdmin" : false
            }

    ).then((value) => print('ok'));


  }

  //sign in 
  Future signIn (String email, String password) async{
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print("FALSE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ e.toString());
      return null;
    }
  }

  //register
  Future register(String email, String password, String displayName, String month, String day, String year, bool termsCheck) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      setData(result.user.uid ,email, password, displayName, month, day, year, termsCheck);
      FirebaseUser user = result.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      
      return null;
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
