import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/drawerList.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyBag extends StatefulWidget {
  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        ///////////////////////////////////////////
        drawer: DrawerList(),
        // Drawer Class
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.blue,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Lego",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            /////////////////Second Header///////////////////
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            //   child: Container(
            //     height: 50,
            //     child: header(widget.isDarkTheme),
            //   ),
            // ),
            ////////////////////////////////////
            Center(
                child: GestureDetector(
              onTap: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                  remember: true,
                  restart: true,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Text(
                  translator.translate('Language'),
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.blue),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      // child: Text('$favNotificationCount'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )),
                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  //     decoration: BoxDecoration(
                  //         shape: BoxShape.circle, color: Colors.red),
                  //     alignment: Alignment.center,
                  //     child: Text('$shoppingNotificationCount'),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
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
                              Icons.favorite_outline_sharp,
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
                              Icons.favorite_outline_sharp,
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
