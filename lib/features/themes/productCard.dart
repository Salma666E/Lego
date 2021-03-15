import 'package:LegoApp/components/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:toast/toast.dart';

Widget productCard(
    BuildContext context, DocumentSnapshot document, String _userID) {
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

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Product(document: document)),
      );
    },
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(document['image'], fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Container(
              color: Colors.yellow[700],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Text(
                  translator.translate('NewProduct'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Container(
              child: Text(
                  translator.currentLanguage == 'en'
                      ? document['name']
                      : document['arabicName'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Container(
              height: 35,
              child: Row(
                children: [
                  for (var i = 0; i < document['rating']; i++)
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Container(
              child: Text(
                '\$${document['price']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.orange[800],
                disabledColor: Colors.orange[200],
                onPressed: document['stock'] <= 0 ? null : () => Add2Bag(),
                child: Text(
                  document['stock'] <= 0
                      ? translator.translate('OutOfBag')
                      : translator.translate('AddToBag'),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
