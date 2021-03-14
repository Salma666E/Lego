import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'product.dart';
import 'package:toast/toast.dart';

Widget buildListItem(BuildContext context, DocumentSnapshot document,
    String _userID, List<String> wishList) {
  Future<bool> changedata(status) async {
    print("status: " + status.toString());
    if (status) {
      // Remove From WishList
      Firestore.instance.collection("wishlist").document(_userID).updateData({
        "productsIDs": FieldValue.arrayRemove([document.documentID])
      });
      Toast.show(translator.translate('RemoveWishList'), context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      // Add To WishList
      Firestore.instance.collection("wishlist").document(_userID).updateData({
        "productsIDs": FieldValue.arrayUnion([document.documentID])
      });
      Toast.show(translator.translate('AddWishList'), context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    return Future.value(!status);
  }

  bool exist = false;
  Add2Bag() async {
    // Add To My Bag
    await Firestore.instance
        .collection("bags")
        .document(_userID)
        .get()
        .then((querySnapshot) async {
      querySnapshot['productsIDs'].forEach((result) async {
        if (result['id'].toString() == document.documentID) {
          exist = true;
          int qtyOld = result['qty'];
          await Firestore.instance
              .collection('bags')
              .document(_userID)
              .updateData({
            'productsIDs': FieldValue.arrayRemove([
              {'qty': qtyOld, 'id': document.documentID}
            ])
          });
          int qty = result['qty'] + 1;
          await Firestore.instance
              .collection('bags')
              .document(_userID)
              .updateData({
            'productsIDs': FieldValue.arrayUnion([
              {'qty': qty, 'id': document.documentID}
            ])
          });
          return result;
        }
      });
      if (!exist) {
        Firestore.instance.collection("bags").document(_userID).updateData({
          "productsIDs": FieldValue.arrayUnion([
            {"id": document.documentID, "qty": 1}
          ])
        });
      }
    });
    Toast.show(translator.translate('AddSuccessfully'), context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  return 
  Card(
    child: Center(
      child: new Column(children: [
        Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0, left: 3.0, top: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Product(document: document)),
                );
              },
              child: Image.network(document['image'],width: double.infinity, height: 250, fit: BoxFit.fill),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
              child: LikeButton(
                onTap: (isLiked) {
                  return changedata(
                    isLiked,
                  );
                },
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                mainAxisAlignment: MainAxisAlignment.start,
                likeBuilder: (isLiked) {
                  if (wishList
                      .contains(document.documentID)) {
                    isLiked = true;
                    wishList.remove(document.documentID);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6.0, right: 0.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        (isLiked || wishList.contains(document.documentID))
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.blue,
                        size: 36,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
        ListTile(
          title: Text(
            translator.currentLanguage == 'en'
                ? document['name'].toString()
                : document['arabicName'].toString(),
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  translator.translate('Price') + document['price'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(translator.translate('AvailableItems') +
                  document['stock'].toString()),
            ],
          ),
        ),
        // Start Rating
        RatingBar.builder(
          initialRating: double.parse(document['rating'].toString()),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, initialRating) {
            switch (initialRating) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
            }
          },
          // onRatingUpdate: (rating) {
          //   print(rating);
          //   // to update rating's data in firebase
          //   document.reference.updateData({'rating': rating});
          // },
          // updateOnDrag: true,
        ),
        // End Ratimg
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  RaisedButton(
                onPressed: document['stock'] <= 0 ? null : () => Add2Bag(),
                textColor: Colors.black,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                    width: double.infinity,
                    // height: 55,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey,
                            offset: Offset(1, 3))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFE65100),
                          Color(0xFFEF6C00),
                          Color(0xFFE65100),
                          Color(0xFFEF6C00),
                          Color(0xFFE65100),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        document['stock'] <= 0
                            ? translator.translate('OutOfBag')
                            : translator.translate('AddToBag'),
                        style: TextStyle(fontSize: 18),
                      ),
                      // child: Text(translator.translate('AddToBag'),
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 22,
                    )),
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}
