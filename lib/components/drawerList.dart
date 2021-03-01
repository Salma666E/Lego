import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:flutter/services.dart';
import 'cardCustom.dart';

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
                  "https://i1.wp.com/codesundar.com/wp-content/uploads/2019/08/cropped-codesundar-favicon.png")),
          title: Text("codesundar"),
          subtitle: Text("me@codesundar.com"),
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
          onTap: () => {},
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
    // Center(
    //   // Aligns the container to center
    //   child: Container(
    //     // A simplified version of dialog.
    //     width: 100.0,
    //     height: 56.0,
    //     color: Colors.green,
    //     child: Text('jojo'),
    //   ),
    // ),
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
          onTap: () => {},
        ),
      ],
    ));
  }
}
