import 'package:LegoApp/components/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/drawerList.dart';

class MyBag extends StatefulWidget {
  MyBag({this.bags});
  final List<String> bags;
  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  void initState() {
    super.initState();
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
                                options: CarouselOptions(height: 400.0),
                                items: snapshot.data.documents.map((doc) {
                                  if (widget.bags
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(children: [
                                                Container(
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
                                                                    child: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .blue,
                                                                )),
                                                              ),
                                                              Expanded(
                                                                  flex: 25,
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_outline_sharp,
                                                                    color: Colors
                                                                        .blue,
                                                                  )),
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
