import 'package:LegoApp/components/CheckOut.dart';
import 'package:LegoApp/components/MyBag.dart';
import 'package:LegoApp/components/WishList.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/features/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'cardCustom.dart';

String _userID = "ggt6vACGkxTV6ZlQeLi7Xm2FOiW2";
String userName = "Lego";
String userEmail="lego.com";
Future<String> getUserName(String _userID) async {
  DocumentSnapshot snapshot =
      await firestore.collection('users').document(_userID).get();
  userName = snapshot.data['displayName'];
  userEmail = snapshot.data['email'];
  print('userName: ' + userName.toString());
  print('userEmail: ' + userEmail.toString());
  return "Name: " + userName + " Email: " + userEmail;
}

List<String> bags=['1','2'];
Future<List<String>> getBagsArray(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('bags').document(documentId).get();
  bags = List.from(snapshot.data['productsIDs']);
  print('flageDrawer+bags: ' + bags.toString());
  return bags;
}

class DrawerList extends StatefulWidget {
  DrawerList({Key key}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  void initState() {
    super.initState();
    print("_userID: " + _userID.toString());
    getUserName(_userID);
    getBagsArray(_userID);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Container(
      child: Drawer(
          child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIMJf32XCdIMPR005aLZbkk5TldBubjW2CfA&usqp=CAU")),
                  title: Text(userName,
                      style: TextStyle(
                        color: Colors.blue,
                      )),
                  subtitle: Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Icon(
                    Icons.close,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => EditProfile()),
                    // );
                  },
                ),
                ListTile(
                  leading: Text(translator.translate('Home')),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Text(translator.translate('Themes')),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Themes()),
                    ),
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(translator.translate('Wishlist')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishList()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(translator.translate('MyBag')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBag(bags: bags)),
                    );
                  },
                ),
                ListTile(
                    leading: Icon(
                      Icons.add_box_outlined,
                      color: Colors.blue,
                    ),
                    title: Text(translator.translate('About')),
                    onTap: () => {
                          showDialog(
                            context: context,
                            builder: (_) => Material(
                              type: MaterialType.transparency,
                              child: MyCardCustom(),
                            ),
                          )
                        }),
                ListTile(
                  leading: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(translator.translate('CheckOut')),
                  // onTap: () => {},
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOut()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}