import 'package:LegoApp/components/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
      ///////////////////////////////////////////
      drawer: DrawerList(),
          // userName: "LegoName",
          // userEmail: "LegoBagEmail.com",
          // bags: widget.bags),
      appBar: appBar(context),
      /////////////////////////////////////////////////////
      body: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection("products")
                        // .where(widget.bags, arrayContains:  '1')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return new Text("There is no expense");
                      return new ListView(children: getExpenseItems(snapshot));
                    }),
      // ListView(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      //       child: Container(
      //         height: 50,
      //         color: Colors.amber[100],
      //         child: const Center(
      //             child: Text(
      //           'We’re currently receiving a lot of LEGO orders! We’re expecting delivery to take longer than usual. Please order early and check your Order Status for updates.',
      //           textAlign: TextAlign.center,
      //         )),
      //       ),
      //     ),
      //     //

      //     Column(
      //       children: [
      //         StreamBuilder<QuerySnapshot>(
      //               stream: Firestore.instance
      //                   .collection("products")
      //                   // .where(widget.bags, arrayContains:  '1')
      //                   .snapshots(),
      //               builder: (BuildContext context,
      //                   AsyncSnapshot<QuerySnapshot> snapshot) {
      //                 if (!snapshot.hasData) return new Text("There is no expense");
      //                 return new ListView(children: getExpenseItems(snapshot));
      //               }),
      //       ],
      //     ),
      //     ////////////Payment Method//////////////////
      //     Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: Card(
      //         clipBehavior: Clip.antiAlias,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: <Widget>[
      //                   Text(
      //                     "Help With Your Order",
      //                     style: TextStyle(fontSize: 15),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: <Widget>[
      //                   Text(
      //                     "Shipping & Handling Returns",
      //                     style: TextStyle(fontSize: 15, color: Colors.blue),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: <Widget>[
      //                   Text(
      //                     "Payment Method",
      //                     style: TextStyle(fontSize: 15),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: <Widget>[
      //                   Icon(Icons.payment_outlined),
      //                   Icon(Icons.payment_outlined),
      //                   Icon(Icons.payment_outlined),
      //                   Icon(Icons.payment_outlined),
      //                   Icon(Icons.payment_outlined)
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     /////////////////////////////
      //   ],
      // ),
    );
  }
}
// /////////////////True////////////////////
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: new StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance
//           .collection("products")
//           // .where(widget.bags, arrayContains:  '1')
//           .snapshots(),
//       builder:
//           (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return new Text("There is no expense");
//         return new ListView(children: getExpenseItems(snapshot));
//       }),
// ),