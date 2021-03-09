import 'package:LegoApp/components/CheckOut.dart';
import 'package:LegoApp/components/MyBag.dart';
import 'package:LegoApp/components/WishList.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/features/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'cardCustom.dart';

// String _userID = "JtvAyccVvjeGrZgt1IoXmYKRAFW2";
// Firestore firestore = Firestore.instance;
// List<String> bags;
// Future<List<String>> getBagsArray(String documentId) async {
//   DocumentSnapshot snapshot =
//       await firestore.collection('bags').document(documentId).get();
//   List<String> productsIDs = List.from(snapshot.data['productsIDs']);
//   print('productsIDs: ' + productsIDs.toString());
//   bags = productsIDs;
//   print('bags: ' + bags.toString());
//   return bags;
// }

class DrawerList extends StatelessWidget {
  DrawerList({this.userName = "LegoName", this.userEmail = "LegoEmail.com", this.bags});
  final String userName;
  final String userEmail;
  final List<String> bags;
  @override
  Widget build(BuildContext context) {
  // getBagsArray(_userID);
    //    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarDividerColor: Colors.transparent,
    // ));
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Drawer(
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
          leading: Text(translator.translate('ShopBy')),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () => {},
        ),
        ListTile(
          leading: Text(translator.translate('Interest')),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () => {},
        ),
        ListTile(
          leading: Text(translator.translate('Exclusive')),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () => {},
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
              MaterialPageRoute(builder: (context) => MyBag(bags:bags)),
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
            Icons.storefront_outlined,
            color: Colors.blue,
          ),
          title: Text(translator.translate('Store')),
          onTap: () => {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => MyStoreCustom())),
          },
        ),
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
    ));
  }
}
