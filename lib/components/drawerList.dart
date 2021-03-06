import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/features/themes/themes.dart';
import 'package:LegoApp/components/CheckOut.dart';
import 'package:LegoApp/components/MyBag.dart';
import 'package:LegoApp/components/WishList.dart';
import 'package:LegoApp/components/login.dart';
import 'package:LegoApp/components/profile.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'cardCustom.dart';

var id = '';
List bags = [];
// List<String> bags = ['1', '2'];
Future<List> getBagsArray(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('bags').document(documentId).get();
  bags = List.from(snapshot.data['productsIDs']);
  print('flageDrawer+bags: ' + bags.toString());
  return bags;
}

// ***********
List<String> wishlist = ['1', '2'];
Future<List<String>> getwishlistArray(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('wishlist').document(documentId).get();
  wishlist = List.from(snapshot.data['productsIDs']);
  print('flageDrawer+wishlist: ' + wishlist.toString());
  return wishlist;
}

// **********
class DrawerList extends StatefulWidget {
  DrawerList({Key key}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final AuthService auth = AuthService();

  String name;
  String email;
  var id = '';
  String account = translator.translate("Sign In");
  var userGet;
  @override
  void initState() {
    super.initState();
    name = '';
    email = '';
    var firestoreInstance = Firestore.instance;

    auth.getPrefs('UserID').then((value) {
      id = value;
      account =translator.translate("Account");
      firestoreInstance
          .collection('users')
          .document(id)
          .get()
          .then((DocumentSnapshot docsnap) {
        setState(() {
          print(docsnap.data["displayName"]);
          name = docsnap.data["displayName"];
          name = "${name[0].toUpperCase()}${name.substring(1)}";
        });
        setState(() {
          print(docsnap.data["email"]);
          email = docsnap.data["email"];
        });
        setState(() {
          print("_userID: " + id.toString());
          // getUserName(id);
          getBagsArray(id);
          getwishlistArray(id);
        });
      });
    });
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
                  title: Text(name,
                      style: TextStyle(
                        color: Colors.blue,
                      )),
                  subtitle: Text(
                    email,
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
                ///////////////////////
                //                 ListTile(
                //       leading: Icon(
                //         Icons.favorite_border_outlined,
                //         color: Colors.blue,
                //       ),
                //       title: Text(translator.translate('Test')),
                //       onTap: () {
                //         Navigator.push(
                //           context,
                // MaterialPageRoute(builder: (context) => Test()),
                //         );
                //       },
                //     ),
                /////////////////
                ListTile(
                  leading: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(translator.translate('Wishlist')),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishList(wishlist: wishlist)),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOut()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(account),
                      
                  onTap: () {
                    print("iddddddddddddddddddddddd" + id);
                    if (id == '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                      id='';
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                      id='';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
