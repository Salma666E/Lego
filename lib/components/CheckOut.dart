import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "name ",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.store_mall_directory),
                        labelText: "City ",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.store_mall_directory),
                        labelText: "Street Address ",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email ",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        labelText: "Phone No. ",
                      ),
                    ),
                    TextField(
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
                        onPressed: () => {},
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
                                    style: TextStyle(fontSize: 15),
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
