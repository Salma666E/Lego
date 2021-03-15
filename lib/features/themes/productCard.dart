import 'package:LegoApp/components/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget productCard(BuildContext context, DocumentSnapshot document) {
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
                onPressed: document['stock'] <= 0 ? null : () {},
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
