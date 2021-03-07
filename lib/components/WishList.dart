import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:LegoApp/components/header.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////////////////////
      drawer: DrawerList(),

      // Image(image: AssetImage('assets/images/Gallery-2-Tall-Large_1.jpg')),

      // Drawer Class
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.blue,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Lego",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          /////////////////Second Header///////////////////
          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
          //   child: Container(
          //     height: 50,
          //     child: header(widget.isDarkTheme),
          //   ),
          // ),
          ////////////////////////////////////
          Center(
              child: GestureDetector(
            onTap: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Text(
                translator.translate('Language'),
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.blue),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                    child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                )),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    alignment: Alignment.center,
                    // child: Text('$favNotificationCount'),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                    child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // do something
                  },
                )),
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle, color: Colors.red),
                //     alignment: Alignment.center,
                //     child: Text('$shoppingNotificationCount'),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
      ////////////////////////////////////////
      body: Center(
          child: ListView(children: <Widget>[
        // Image(image: AssetImage('assets/images/header3.PNG')),

////////////////////////////////////////
        Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                Expanded(
                  flex: 66,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Center(
                            child: Text(
                          'Levis Lego T-Shirt (8-12) ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        )),
                      ),
                      Expanded(
                          flex: 25,
                          child: Text(
                            'Available Now',
                            style: TextStyle(color: Colors.green),
                          )),
                      Expanded(flex: 25, child: Text('22.2EG')),
                    ],
                  ),
                ),
                Expanded(
                  flex: 66,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Center(
                            child: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        )),
                      ),
                      // Expanded(flex: 25, child: Text('Available Now')),
                      Expanded(
                          flex: 25,
                          child: Icon(
                            Icons.storefront,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ///////////////////////Second Card////////////////////
        Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                Expanded(
                  flex: 66,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Center(
                            child: Text(
                          'BirthDay Gift',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        )),
                      ),
                      Expanded(
                          flex: 25,
                          child: Text(
                            'Available Now',
                            style: TextStyle(color: Colors.green),
                          )),
                      Expanded(flex: 25, child: Text('99.9EG')),
                    ],
                  ),
                ),
                Expanded(
                  flex: 66,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Center(
                            child: Icon(
                          Icons.delete,
                          color: Colors.blue,
                        )),
                      ),
                      // Expanded(flex: 25, child: Text('Available Now')),
                      Expanded(
                          flex: 25,
                          child: Icon(
                            Icons.storefront,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ////////////////////// OrderDetails Card/////////////////
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title:
                      const Text('Discover The Benefits of Creating LEGO\n ID'),
                ),
                Text(
                  '━━━━━━━━━━━━━━━━━━━━━━━━',
                  // textAlign: TextAlign.right,
                  // overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: const Text(
                      'Access WishList From any Computer -\n even if it is on a space Ship orbiting the moon',
                      style: TextStyle(fontSize: 13)),
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
