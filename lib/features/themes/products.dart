import 'package:LegoApp/features/themes/productCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // List<String> _locations = ['A', 'B', 'C']; // Option 2
  String _selectedCategory = "nothing"; // Option 2
  Color _selectCategoryColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('categories').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text(translator.translate('Lodding')));
            }
            return ExpansionTile(
              onExpansionChanged: (expanded) {
                if (expanded) {
                  setState(() {
                    _selectCategoryColor = Colors.black;
                  });
                } else {
                  setState(() {
                    _selectCategoryColor = Colors.grey[800];
                  });
                }
              },
              backgroundColor: Colors.blueGrey[100],
              title: Text(
                translator.translate('SelectCategory'),
                style: TextStyle(
                  color: _selectCategoryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              childrenPadding: EdgeInsets.only(bottom: 10.0),
              children: [
                Wrap(
                  children: List<Widget>.generate(
                      snapshot.data.documents.length, (int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory =
                                snapshot.data.documents[index].documentID;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: _selectedCategory ==
                                snapshot.data.documents[index].documentID
                            ? Colors.orange[800]
                            : Colors.orange,
                        child: Text(
                          translator.currentLanguage == 'en'
                              ? snapshot.data.documents[index]['name']
                              : snapshot.data.documents[index]['arabicName'],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _selectedCategory == "nothing"
                ? Firestore.instance.collection('products').snapshots()
                : Firestore.instance
                    .collection('products')
                    .where("categoryID", isEqualTo: _selectedCategory)
                    .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text(translator.translate('Lodding')));
              }
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return productCard(context, snapshot.data.documents[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
