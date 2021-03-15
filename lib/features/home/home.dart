import 'package:LegoApp/components/register.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:LegoApp/components/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../components/buildListItem.dart';
import '../../components/drawerList.dart';
import '../../components/slider.dart';
import '../../components/app_bar.dart';

var id = '';
Firestore firestore = Firestore.instance;
List<String> wishList=[""];
Future<List<String>> getWishListArray(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('wishlist').document(documentId).get();
  List<String> productsIDs = List.from(snapshot.data['productsIDs']);
  print('productsIDs HOME: ' + productsIDs.toString());
  wishList = productsIDs;
  return productsIDs;
}

class Home extends StatefulWidget {
  const Home({
    this.isDarkTheme = false,
    this.onThemeChanged = _dummyOnFocusChange,
  }) : assert(onThemeChanged != null);

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;
  static dynamic _dummyOnFocusChange(bool val) {}

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService auth = AuthService();
  String name;
  String email;
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    auth.getPrefs('UserID').then((value) {
      print('id: ' + id.toString());
      id = value;
      setState(() {
        getWishListArray(id);
      });
    });
    if (id.isNotEmpty)
      // setState(() {
      getWishListArray(id);
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      drawer: DrawerList(),
      appBar: appBar(context),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
              // height: 50,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: header(widget.isDarkTheme),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
              // height: 250,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: slider(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              translator.translate('TrandNow'),
              style: TextStyle(
                color: widget.isDarkTheme ? Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                  // height: 350,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Container(
                height: 50,
                child: Text(
                  translator.translate('Recommended'),
                  style: TextStyle(
                    color: widget.isDarkTheme ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('products').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: Text(translator.translate('Lodding')));
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    // itemExtent: 410.0,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, int index) => buildListItem(context,
                        snapshot.data.documents[index], id, wishList),
                  );
                }),
          ),
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
                        // new Container(
                            // height: 45.0,
                        //     width: 45.0,
                        //     child: Center(
                        //       child: Card(
                        //         elevation: 5.0,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(
                        //               25.0), // half of height and width of Image
                        //         ),
                        //         child: IconButton(
                        //           icon: widget.isDarkTheme
                        //               ? Transform.rotate(
                        //                   angle: .55,
                        //                   child: Icon(
                        //                     Icons.brightness_3,
                        //                     size: 20.0,
                        //                   ))
                        //               : Icon(Icons.brightness_7),
                        //           onPressed: () {
                        //             widget.onThemeChanged(!widget.isDarkTheme);
                        //             print("widget.isDarkTheme: " +
                        //                 widget.isDarkTheme.toString());
                        //           },
                        //           tooltip: 'Switch brightness',
                        //         ),
                        //       ),
                        //     )),
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
