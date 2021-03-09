import 'package:LegoApp/components/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget _buildList(
    BuildContext context, DocumentSnapshot document, List<String> bags) {
  print("bags:: " + bags.toString());
  print("document.documentID: " + document.documentID.toString());
  print("bags.contains(document.documentID): " +
      bags.contains(document.documentID).toString());

  return bags.contains(document.documentID).toString() == "true"
      ? Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    document['image'],
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
                          document['name'],
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
                      Expanded(
                          flex: 25, child: Text(document['price'].toString())),
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
        )
      : Container(height: 50, child: Text("NO Data",style: TextStyle(color: Colors.black),));
}

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

  @override
  Widget build(BuildContext context) {
    print('bags:- ' + widget.bags.toString());
    return Scaffold(
        ///////////////////////////////////////////
        drawer: DrawerList(
            userName: "LegoName",
            userEmail: "LegoBagEmail.com",
            bags: widget.bags),
        appBar: appBar(context),
        /////////////////////////////////////////////////////
        body: Center(
            child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
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
////////////////////////////////////////

          StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('products').snapshots(),
              // .where(widget.bags, arrayContains: snapshot.data.documents[index].documentID).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: Text(translator.translate('Lodding')));
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemExtent: 410.0,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, int index) {
                    _buildList(
                        context, snapshot.data.documents[index], widget.bags);
                  },
                );
              }),
          // //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          // //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ////////////////////// OrderDetails Card/////////////////
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
                    // textAlign: TextAlign.right,
                    // overflow: TextOverflow.ellipsis,
                    // style: TextStyle(fontWeight: FontWeight.bold),
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
                          "13.2EG",
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
                          "14%",
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
                          "150EG",
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
          //////////////Payment Method//////////////////
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
                          style: TextStyle(fontSize: 15, color: Colors.blue),
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
        ])));
  }
}
