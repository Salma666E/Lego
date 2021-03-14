// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../components/drawerList.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';

// class WishList extends StatefulWidget {
//   @override
//   _WishListState createState() => _WishListState();
// }

// class _WishListState extends State<WishList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       ///////////////////////////////////
//       drawer: DrawerList(),

//       appBar: AppBar(
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: Icon(
//               Icons.menu_rounded,
//               color: Colors.blue,
//             ),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: Text(
//           "Lego",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: <Widget>[
//           /////////////////Second Header///////////////////

//           ////////////////////////////////////
//           Center(
//               child: GestureDetector(
//             onTap: () {
//               translator.setNewLanguage(
//                 context,
//                 newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
//                 remember: true,
//                 restart: true,
//               );
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(right: 8.0, left: 8.0),
//               child: Text(
//                 translator.translate('Language'),
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 14,
//                     color: Colors.blue),
//               ),
//             ),
//           )),
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 Center(
//                     child: IconButton(
//                   icon: Icon(
//                     Icons.favorite_border,
//                     color: Colors.blue,
//                   ),
//                   onPressed: () {},
//                 )),
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.red),
//                     alignment: Alignment.center,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0, right: 8.0),
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 Center(
//                     child: IconButton(
//                   icon: Icon(
//                     Icons.shopping_bag_outlined,
//                     color: Colors.blue,
//                   ),
//                   onPressed: () {
//                     // do something
//                   },
//                 )),
//               ],
//             ),
//           ),
//         ],
//       ),
//       ////////////////////////////////////////
//       body: Center(
//           child: ListView(children: <Widget>[
// ////////////////////////////////////////
//         Container(
//           height: 150,
//           child: Card(
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 33,
//                   child: Image.network(
//                     'https://picsum.photos/250?image=9',
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Text(
//                           'Levis Lego T-Shirt (8-12) ',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.end,
//                         )),
//                       ),
//                       Expanded(
//                           flex: 25,
//                           child: Text(
//                             'Available Now',
//                             style: TextStyle(color: Colors.green),
//                           )),
//                       Expanded(flex: 25, child: Text('22.2EG')),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Icon(
//                           Icons.delete,
//                           color: Colors.blue,
//                         )),
//                       ),
//                       // Expanded(flex: 25, child: Text('Available Now')),
//                       Expanded(
//                           flex: 25,
//                           child: Icon(
//                             Icons.storefront,
//                             color: Colors.blue,
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         ///////////////////////Second Card////////////////////
//         Container(
//           height: 150,
//           child: Card(
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 33,
//                   child: Image.network(
//                     'https://picsum.photos/250?image=9',
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Text(
//                           'BirthDay Gift',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.end,
//                         )),
//                       ),
//                       Expanded(
//                           flex: 25,
//                           child: Text(
//                             'Available Now',
//                             style: TextStyle(color: Colors.green),
//                           )),
//                       Expanded(flex: 25, child: Text('99.9EG')),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Icon(
//                           Icons.delete,
//                           color: Colors.blue,
//                         )),
//                       ),
//                       Expanded(
//                           flex: 25,
//                           child: Icon(
//                             Icons.storefront,
//                             color: Colors.blue,
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         ////////////////////// OrderDetails Card/////////////////
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             child: Column(
//               children: [
//                 ListTile(
//                   title:
//                       const Text('Discover The Benefits of Creating LEGO\n ID'),
//                 ),
//                 Text(
//                   '━━━━━━━━━━━━━━━━━━━━━━━━',
//                 ),
//                 ListTile(
//                   title: const Text(
//                       'Access WishList From any Computer -\n even if it is on a space Ship orbiting the moon',
//                       style: TextStyle(fontSize: 13)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ])),
//     );
//   }
// }
////////////////////////////////////////////////////////////
// import 'package:LegoApp/components/app_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../components/drawerList.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';

// class WishList extends StatefulWidget {
//   WishList({this.wishlist);
//   final List<String> wishlist;
//   @override
//   _WishListState createState() => _WishListState();
// }

// class _WishListState extends State<WishList> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
//     return snapshot.data.documents.map((doc) {
//       if (widget.wishlist.contains(doc.documentID).toString() == "true")
//         return Container(
//           height: 150,
//           child: Card(
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 33,
//                   child: Image.network(
//                     doc['image'],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Text(
//                           doc['name'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.end,
//                         )),
//                       ),
//                       Expanded(
//                           flex: 25,
//                           child: Text(
//                             'Available Now',
//                             style: TextStyle(color: Colors.green),
//                           )),
//                       Expanded(flex: 25, child: Text(doc['price'].toString())),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 66,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 50,
//                         child: Center(
//                             child: Icon(
//                           Icons.delete,
//                           color: Colors.blue,
//                         )),
//                       ),
//                       Expanded(
//                           flex: 25,
//                           child: Icon(
//                             Icons.favorite_outline_sharp,
//                             color: Colors.blue,
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       else
//         return Container(
//           height: 1,
//         );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('wishlist:- ' + widget.wishlist.toString());
//     return Scaffold(
//       ///////////////////////////////////////////
//       drawer: DrawerList(),

//       appBar: appBar(context),
//       /////////////////////////////////////////////////////
//       body: StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection("products").snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return new Text("There is no expense");
//             return new ListView(children: getExpenseItems(snapshot));
//           }),
//     );
//   }
// }
//////////////////////////////////////////////////////
import 'package:LegoApp/components/app_bar.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:toast/toast.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

var id = '';

// Widget buildListItem(BuildContext context,DocumentSnapshot document,String _userID)

// String _userID = "Xhl4PYKbc0ObiSBG1g67jEmylG33";

class WishList extends StatefulWidget {
  WishList({this.wishlist});
  final List<String> wishlist;
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List<String> wishlist;
  Future<List<String>> getwishlistArray(String documentId) async {
    DocumentSnapshot snapshot =
        await firestore.collection('wishlist').document(documentId).get();
    wishlist = List.from(snapshot.data['productsIDs']);
    print('flageDrawer+wishlish: ' + wishlist.toString());
    return wishlist;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getWishListArray(_userID);

  //   setState(() {});
  // }
  final AuthService auth = AuthService();
  String name;
  String email;
  @override
  void initState() {
    super.initState();
    name = '';
    email = '';
    var firestoreInstance = Firestore.instance;

    auth.getPrefs('UserID').then((value) {
      id = value;
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
          print("id: " + id.toString());
          getBagsArray(id);
          getWishListArray(id);
        });
      });
    });
    setState(() {});
  }

  /////////////////////////
  bool exist = false;
  Add2Bag(DocumentSnapshot document) async {
    // Add To My Bag
    await Firestore.instance
        .collection("bags")
        .document(id)
        .get()
        .then((querySnapshot) async {
      querySnapshot['productsIDs'].forEach((result) async {
        if (result['id'].toString() == document.documentID) {
          exist = true;
          int qtyOld = result['qty'];
          await Firestore.instance.collection('bags').document(id).updateData({
            'productsIDs': FieldValue.arrayRemove([
              {'qty': qtyOld, 'id': document.documentID}
            ])
          });
          int qty = result['qty'] + 1;
          await Firestore.instance.collection('bags').document(id).updateData({
            'productsIDs': FieldValue.arrayUnion([
              {'qty': qty, 'id': document.documentID}
            ])
          });
          return result;
        }
      });
      if (!exist) {
        Firestore.instance.collection("bags").document(id).updateData({
          "productsIDs": FieldValue.arrayUnion([
            {"id": document.documentID, "qty": 1}
          ])
        });
      }
    });
    Toast.show(translator.translate('AddSuccessfully'), context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    ////////////////////////////////
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents.map((doc) {
      if (widget.wishlist.contains(doc.documentID).toString() == "true")
        return Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    doc['image'],
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
                          doc['name'],
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
                      Expanded(flex: 25, child: Text(doc['price'].toString())),
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
                      Expanded(
                          flex: 25,
                          child: Icon(
                            Icons.favorite_outline_sharp,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      else
        return Container(
          height: 1,
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    Future<bool> changedata(status, DocumentSnapshot document) async {
      print("status: " + status.toString());
      if (status) {
        // Remove From WishList
        Firestore.instance.collection("wishlist").document(id).updateData({
          "productsIDs": FieldValue.arrayRemove([document.documentID])
        });
        Toast.show(translator.translate('RemoveWishList'), context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        // Add To WishList
        Firestore.instance.collection("wishlist").document(id).updateData({
          "productsIDs": FieldValue.arrayUnion([document.documentID])
        });
        Toast.show(translator.translate('AddWishList'), context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
      return Future.value(!status);
    }

    print('wishlist:- ' + widget.wishlist.toString());
    return Scaffold(
        drawer: DrawerList(),
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
              child: Container(
                height: 50,
                color: Colors.amber[100],
                // child: const Center(
                //     child: Text(
                //   'We’re currently receiving a lot of LEGO orders! We’re expecting delivery to take longer than usual. Please order early and check your Order Status for updates.',
                //   textAlign: TextAlign.center,
                // )),
              ),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 30,
            ),
            // ////////////////////////////////////////////////////
            Card(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('products')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null)
                              return CircularProgressIndicator();
                            return CarouselSlider(
                              options: CarouselOptions(height: 250.0),
                              items: snapshot.data.documents.map((doc) {
                                if (widget.wishlist
                                        .contains(doc.documentID)
                                        .toString() ==
                                    "true")
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.grey[100]),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(children: [
                                              Container(
                                                height: 200,
                                                child: Card(
                                                  color: Colors.white,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 33,
                                                        child: Image.network(
                                                          doc['image'],
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
                                                                doc['name'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                              )),
                                                            ),
                                                            Expanded(
                                                                flex: 25,
                                                                child: Text(
                                                                  'Available Now',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green),
                                                                )),
                                                            Expanded(
                                                                flex: 25,
                                                                child: Text(doc[
                                                                        'price']
                                                                    .toString())),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 66,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              flex: 50,
                                                              child: IconButton(
                                                                icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .blue),
                                                                onPressed: () {
                                                                  Firestore
                                                                      .instance
                                                                      .collection(
                                                                          "wishlist")
                                                                      .document(
                                                                          id)
                                                                      .delete();
                                                                  // Firestore
                                                                  //     .instance
                                                                  //     .collection(
                                                                  //         "wishlist")
                                                                  //     .document(
                                                                  //         id)
                                                                  //     .updateData({
                                                                  //   "productsIDs":
                                                                  //       FieldValue
                                                                  //           .arrayRemove([
                                                                  //     doc.documentID
                                                                  //   ])
                                                                  // });

                                                                  Toast.show(
                                                                      translator
                                                                          .translate(
                                                                              'Delted Item'),
                                                                      context,
                                                                      duration:
                                                                          Toast
                                                                              .LENGTH_SHORT,
                                                                      gravity: Toast
                                                                          .BOTTOM);
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 25,
                                                              child: Center(
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                      Icons
                                                                          .storefront,
                                                                      color: Colors
                                                                          .blue),
                                                                  onPressed: () =>
                                                                      Add2Bag(
                                                                          doc),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ])),
                                      );
                                    },
                                  );
                              }).toList(),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 30,
            ),
            ////////////Payment Method//////////////////
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                          'Discover The Benefits of Creating LEGO\n ID'),
                    ),
                    Text(
                      '━━━━━━━━━━━━━━━━━━━━━━━━',
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
        ));
  }
}
//
