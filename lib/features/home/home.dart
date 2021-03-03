import 'package:LegoApp/helper/addNotification.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:LegoApp/components/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../components/buildListItem.dart';
import '../../components/drawerList.dart';
import '../../components/slider.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    this.isDarkTheme,
    this.onThemeChanged,
  }) : super(key: key);

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkTheme = false;
  int favNotificationCount = 0;
  int shoppingNotificationCount = 0;
  String _userID = "JtvAyccVvjeGrZgt1IoXmYKRAFW2";

  @override
  void initState() {
    super.initState();
    getBagsLength();
    getWishlistsLength();
  }

  Future<void> getBagsLength() async {
    shoppingNotificationCount = await getBagArrayLength(_userID);
    setState(() {});
  }

  Future<void> getWishlistsLength() async {
    favNotificationCount = await getWishListArrayLength(_userID);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerList(), // Drawer Class
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
                    child: Text('$favNotificationCount'),
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
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    alignment: Alignment.center,
                    child: Text('$shoppingNotificationCount'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
              height: 50,
              child: header(widget.isDarkTheme),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
              height: 250,
              child: slider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              translator.translate('TrandNow'),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
                height: 330,
                child: Column(
                  children: [
                    Image(
                        image: AssetImage(
                            'assets/images/Gallery-2-Tall-Large_1.jpg')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(translator.translate('SuperMario')),
                    ),
                    Text(translator.translate('SuperMarioDescr')),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
                height: 50,
                child: Text(
                  translator.translate('Recommended'),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: Text(translator.translate('Lodding')));
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemExtent: 410.0,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, int index) => buildListItem(
                      context,
                      snapshot
                          .data.documents[index] /*, favNotificationCount*/),
                );
              }),
          Container(
            height: 400,
            child: Center(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                    icon: widget.isDarkTheme
                                        ? Transform.rotate(
                                            angle: .55,
                                            child: Icon(
                                              Icons.brightness_3,
                                              size: 20.0,
                                            ))
                                        : Icon(Icons.brightness_7),
                                    onPressed: () => widget
                                        .onThemeChanged(!widget.isDarkTheme),
                                    tooltip: 'Switch brightness',
                                  ),
                                ),
                              )),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                    icon: new Icon(
                                      Icons.person,
                                      size: 20.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              )),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                    icon: new Icon(
                                      Icons.call,
                                      size: 20.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: translator.translate('EnterYourEmail'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: AnimatedButton(
                        onPress: () {},
                        height: 60,
                        width: 200,
                        text: translator.translate('Submit'),
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.CENTER_ROUNDER,
                        backgroundColor: Colors.black,
                        borderColor: Colors.black,
                        borderRadius: 50,
                        borderWidth: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          translator.translate('Endfooter'),
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
