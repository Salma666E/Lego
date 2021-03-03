import 'package:LegoApp/components/CheckOut.dart';
import 'package:LegoApp/features/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'cardCustom.dart';
import 'storeCustom.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          title: Text("lego's user"),
          subtitle: Text("me@lego.com"),
          trailing: Icon(
            Icons.close,
            color: Colors.blue,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: Text(translator.translate('Home')),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () => Navigator.of(context).pop(),
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
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.blue,
          ),
          title: Text(translator.translate('MyBag')),
          onTap: () => {},
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyCardCustom())),
                }),
        ListTile(
          leading: Icon(
            Icons.storefront_outlined,
            color: Colors.blue,
          ),
          title: Text(translator.translate('Store')),
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyStoreCustom())),
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