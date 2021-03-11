import 'package:LegoApp/features/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

String _userID = 'GodEdO1YDAKTE2LNDp1V';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final myconrollar1 = TextEditingController();
  final myconrollar2 = TextEditingController();
  final myconrollar3 = TextEditingController();
  final myconrollar4 = TextEditingController();
  final myconrollar5 = TextEditingController();
  final myconrollar6= TextEditingController();
  int subtotal =0;
  double ordertotal =0 ;
  var listofproducts;

  @override
  void initState() {
    super.initState();
    print("-------------------------------------------------------------------------------------");
    Firestore.instance.collection("bags").getDocuments().then((value) {
       value.documents.forEach((element) {
         var data =element.data;
         if(data['userID']==_userID){
            setState((){
                listofproducts=data['productsIDs'];
            });
            for (var v in data['productsIDs']) {
              Firestore.instance.collection("products").document(v['id']).get().then(
                (val){
                  print("PRODUCTTT");
                  var prd=val.data;
                  int price =prd['price'];
                  int qty=v['qty'];
                  setState(() {
                    subtotal+=(price*qty);
                    ordertotal+=subtotal+(subtotal*14/100);
                  });
                });
            }
         }
       });
    }); 

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller:myconrollar1,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "name ",
                      ),
                    ),
                    TextField(
                      controller:myconrollar2,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.store_mall_directory_outlined),
                        labelText: "City ",
                      ),
                    ),
                    TextField(
                      controller:myconrollar3,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.store_mall_directory),
                        labelText: "Street Address ",
                      ),
                    ),
                    TextField(
                      controller:myconrollar4,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email ",
                      ),
                    ),
                    TextField(
                      controller:myconrollar5,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        labelText: "Phone No. ",
                      ),
                    ),
                    TextField(
                      controller:myconrollar6,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.radio_button_unchecked),
                        labelText: "Card No. ",
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () => {
                            Firestore.instance.collection("orders").add(
                            {
                              "address":{
                                "city":myconrollar2.text ,
                                "street": myconrollar3.text,
                                "zip" : myconrollar6.text
                              },
                              "date":DateFormat('yMd').format(new DateTime.now()),
                              "mobilePhone":myconrollar5.text,
                              "productsIDs":listofproducts,
                              "totalPrice":ordertotal,
                              "userID":_userID

                            }).then((value)=>print("SUCCSE")),

                            Toast.show(('Thank you for shopping from lego your order be ready in few days'), context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),

                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()))
             
                        },
                        minWidth: 150.0,
                        height: 50.0,
                        color: Color(0xFF179CDF),
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    /////////////////First Card///////////////////
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
                                    "$subtotal EG",
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
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Spacer(),
                                  Spacer(),
                                  Text(
                                    "$ordertotal EG",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Image.network(
                                'https://picsum.photos/seed/picsum/200/300'),
                          ],
                        ),
                      ),
                    ),
                    /////////////////////Second-Card////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: <Widget>[
                                  Spacer(),
                                  Text(
                                    "Weeding Favour Set 2021",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Spacer(),
                                  Text(
                                    "Available Now",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.lightGreen),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: <Widget>[
                                  Spacer(),
                                  Text(
                                    "9.99EG",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Image.network(
                              'https://picsum.photos/seed/picsum/200/300',
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
