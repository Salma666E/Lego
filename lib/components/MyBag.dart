// import 'package:LegoApp/components/app_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../components/drawerList.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';

// class MyBag extends StatefulWidget {
//   MyBag({this.bags});
//   final List<String> bags;
//   @override
//   _MyBagState createState() => _MyBagState();
// }

// class _MyBagState extends State<MyBag> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
//     return snapshot.data.documents.map((doc) {
//       if (widget.bags.contains(doc.documentID).toString() == "true")
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
//     print('bags:- ' + widget.bags.toString());
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
// import 'dart:html';

//////////////////////////////////////////////////////
import 'package:LegoApp/components/app_bar.dart';
import 'package:LegoApp/features/home/home.dart';
import 'package:LegoApp/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:toast/toast.dart';
import '../components/drawerList.dart';

var id = '';

class MyBag extends StatefulWidget {
  MyBag({this.bags});
  final List<String> bags;
  @override
  _MyBagState createState() => _MyBagState();
}

double Total = 0.0;
double Tax = .14;

class _MyBagState extends State<MyBag> {
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
  //   getBagsArray(_userID);
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

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents.map((doc) {
      if (widget.bags.contains(doc.documentID).toString() == "true")
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
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ),
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

    print('bags:- ' + widget.bags.toString());
    return Scaffold(
        drawer: DrawerList(),
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: const Center(
                      child: Text(
                    'We’re currently receiving a lot of LEGO orders! We’re expecting delivery to take longer than usual. Please order early and check your Order Status for updates.',
                    textAlign: TextAlign.center,
                  )),
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
                                  // setState(() {
                                  Total += doc['price'];
                                  // });
                                  if (widget.bags
                                          .contains(doc.documentID)
                                          .toString() ==
                                      "true") {
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                                child: Center(
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Colors
                                                                            .blue),
                                                                    // onPressed:
                                                                    //     () {},
                                                                    onPressed:
                                                                        () {
                                                                      // Add To My Bag

                                                                      Firestore
                                                                          .instance
                                                                          .collection(
                                                                              "bags")
                                                                          .document(
                                                                              id)
                                                                          .delete();

                                                                      Toast.show(
                                                                          translator.translate(
                                                                              'Delted Item'),
                                                                          context,
                                                                          duration: Toast
                                                                              .LENGTH_SHORT,
                                                                          gravity:
                                                                              Toast.BOTTOM);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 25,
                                                                child:
                                                                    LikeButton(
                                                                  onTap:
                                                                      (isLiked) {
                                                                    return changedata(
                                                                        isLiked,
                                                                        doc);
                                                                  },
                                                                  circleColor: CircleColor(
                                                                      start: Color(
                                                                          0xff00ddff),
                                                                      end: Color(
                                                                          0xff0099cc)),
                                                                  bubblesColor:
                                                                      BubblesColor(
                                                                    dotPrimaryColor:
                                                                        Color(
                                                                            0xff33b5e5),
                                                                    dotSecondaryColor:
                                                                        Color(
                                                                            0xff0099cc),
                                                                  ),
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  likeBuilder:
                                                                      (isLiked) {
                                                                    if (wishList
                                                                        .contains(
                                                                            doc.documentID)) {
                                                                      isLiked =
                                                                          true;
                                                                      wishList.remove(
                                                                          doc.documentID);
                                                                    }
                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              6.0,
                                                                          right:
                                                                              0.0),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            Icon(
                                                                          (isLiked || wishList.contains(doc.documentID))
                                                                              ? Icons.favorite
                                                                              : Icons.favorite_border_outlined,
                                                                          color:
                                                                              Colors.blue,
                                                                          size:
                                                                              36,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
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
                                  }
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
              ////////////////CardShipping Detail/////////////////
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Order Summary'),
                      ),
                      Text(
                        '━━━━━━━━━━━━━━━━━━━━━━━━',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "SubTotal",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Spacer(),
                            Text(
                              // "13.2EG",
                              Total.toStringAsFixed(2),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "StandardShipping",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Spacer(),
                            Text(
                              "Free",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Tax",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Spacer(),
                            Text(
                              "0",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "OrderTotal",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Spacer(),
                            Text(
                              // "150EG",
                              Total.toStringAsFixed(2) +
                                  Total.toStringAsFixed(2) * Tax.toInt(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Colors.teal[100],
                        child: const Center(
                            child: Text(
                          'Congratiolations You Get Shipping Free',
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              ////////////Payment Method//////////////////
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Help With Your Order",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Shipping & Handling Returns",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Payment Method",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.payment_outlined),
                            Icon(Icons.payment_outlined),
                            Icon(Icons.payment_outlined),
                            Icon(Icons.payment_outlined),
                            Icon(Icons.payment_outlined)
                          ],
                        ),
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
            ],
          )),
        ));
  }
}
