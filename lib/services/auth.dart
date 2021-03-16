import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*import 'dart:math';
import 'package:random_string/random_string.dart';*/


class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;
  
  dynamic currentUserID;

  Future currentUserSetter(var value) async{
    currentUserID = value;
  }

  Future currentUserGetter () async{
    return currentUserID;
   }

  /*//returns a User class if the user is signed in, or null if they are not
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });*/

  //create user obj based on Firebase User
  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return auth.onAuthStateChanged.map(userFromFirebaseUser);
  }


  //save data to the firestore
  Future setData(String uid, String email, String password, String displayName,
      String month, String day, String year, bool termsCheck) async {
    //var randomDoc = firestoreInstance.collection('users').document();
    firestoreInstance
        .collection('users')
        .document(uid)
        .setData({
      "uid": uid,
      "email": email,
      "password": password,
      "displayName": displayName,
      "birthday": {"month": month, "day": day, "year": year},
      "termsandconditionscheck": termsCheck,
      "isAdmin": false
    });

    firestoreInstance
        .collection('bags')
        .document(uid)
        .setData({
          "productsIDs": [],
          "userID": uid
        }); 

    firestoreInstance
        .collection('wishlist')
        .document(uid)
        .setData({
          "productsIDs": [],
          "userID": uid
        }); 
  }

  Future forgotPassword(String email) async{
    try{
      auth.sendPasswordResetEmail(email: email);
    }catch (e) {
      return null;
    }
  }

  //sign in
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      
      setPref(result.user.uid);
      return userFromFirebaseUser(user);
    } catch (e) {
      print("FALSE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + e.toString());
      return null;
    }
  }

  //register
  Future register(String email, String password, String displayName,
      String month, String day, String year, bool termsCheck) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      setData(result.user.uid, email, password, displayName, month, day, year,
          termsCheck);
      
      
      FirebaseUser user = result.user;
      //setPref();
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  
  Future<String> getDataTrial() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    return uid;
  }

  Future<String> getUser() async {
  final uid = await getDataTrial();
  print("uidddddddd " + uid);
  //print("Whole Lineeeeeeeeeeeeeeeeeeee " + Firestore.instance.document("users/$uid").get().toString());
  //return Firestore.instance.document("users/$uid").get(); DocumentSnapshot
  return uid;
 }

  Future<void> setPref(dynamic getid) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("UserID", getid);
   //print("SET PREFFFFFFFFFFFFFFFFFFFFFFFS"+ getPrefs());
 }

 Future<String> getPrefs(String key) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String getPrefsString = prefs.getString(key);
   print("AUTH GETTTTTTTTTTTTTTTTTTTTT " + getPrefsString);
   return getPrefsString;
 }

  //signout
  Future signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('UserID');
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
