import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


Widget buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Center(
        child: new Column(children: [
          ListTile(
            title: Image(
                image: AssetImage(document['image']),
                height: 150,
                width: 300,
                fit: BoxFit.fill),
            trailing: IconButton(
              icon: new Icon(
                Icons.favorite_border_outlined,
                color: Colors.blue,
              ),
              onPressed: () {/* Your code */},
            ),
          ),
          ListTile(
            title: Text(
              document['name'],
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              document['price'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(document['description']),
            subtitle: Text(translator.translate('AvailableItems') + document['stock'].toString()),
          ),
          const SizedBox(height: 30),
          RaisedButton(
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
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFB3E5FC),
                    Color(0xFF0277BD),
                    Color(0xFF4FC3F7),
                    Color(0xFFB3E5FC),
                    Color(0xFF03A9F4),
                    Color(0xFF0288D1),
                    Color(0xFFB3E5FC),
                  ],
                ),
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
          )
        ]),
      ),
    );
  }
