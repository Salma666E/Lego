import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(children: <Widget>[
////////////////////////////////////////
        Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
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
                          'Levis Lego T-Shirt (8-12) ',
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
                      Expanded(flex: 25, child: Text('22.2EG')),
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
                      // Expanded(flex: 25, child: Text('Available Now')),
                      Expanded(
                          flex: 25,
                          child: Icon(
                            Icons.storefront,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ///////////////////////Second Card////////////////////
        Container(
          height: 150,
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 33,
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
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
                          'BirthDay Gift',
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
                      Expanded(flex: 25, child: Text('99.9EG')),
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
                      // Expanded(flex: 25, child: Text('Available Now')),
                      Expanded(
                          flex: 25,
                          child: Icon(
                            Icons.storefront,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        ////////////////////// OrderDetails Card/////////////////
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title:
                      const Text('Discover The Benefits of Creating LEGO\n ID'),
                ),
                Text(
                  '━━━━━━━━━━━━━━━━━━━━━━━━',
                  // textAlign: TextAlign.right,
                  // overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: const Text(
                      'Access WishList From any Computer -\n even if it is on a space Ship orbiting the moon',
                      style: TextStyle(fontSize: 13)),
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
