import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget buildListItem(BuildContext context, DocumentSnapshot document) {
  return Card(
    child: Center(
      child: new Column(children: [
        Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0, left: 3.0, top: 15.0),
            child: Image.network(document['image'],
                height: 150, width: 350, fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 10.0),
              child: IconButton(
                icon: new Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.blue,
                ),
                onPressed: () {/* Your code */},
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
          onRatingUpdate: (rating) {
            print(rating);
          },
          updateOnDrag: true,
        ),
        // End Ratimg
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: 300,
              height: 55,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.grey, offset: Offset(1, 3))
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                /*gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFB3E5FC),
                    Color(0xFF0277BD),
                    Color(0xFF4FC3F7),
                    Color(0xFFB3E5FC),
                    Color(0xFF03A9F4),
                    Color(0xFF0288D1),
                    Color(0xFFB3E5FC),
                  ],
                ),*/
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(translator.translate('AddToBag'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )),
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}
