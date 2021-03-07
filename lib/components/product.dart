import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'drawerList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'drawerList.dart';
import 'package:LegoApp/models/review.dart';

Future<List<Review>> getReviews(String prdId) async {
  List<Review> reviews = [];
  final QuerySnapshot snapshot =
      await Firestore.instance.collection('Reviews').getDocuments();
      
  final documents = snapshot.documents;
  documents.forEach((element) {
    if (element.data['productId'] == prdId) {
      reviews.add(Review(
          element.data['OverallRating'],
          element.data['productId'],
          element.data['review'],
          element.data['recommend'],
          element.data['reviewTitle']));
    }
  });
  return reviews;
}

Future<int> getReviewsLength(String prdId) async {
  List<Review> reviews = [];
  int revNumber = 0;
  final QuerySnapshot snapshot =
      await Firestore.instance.collection('Reviews').getDocuments();
  final documents = snapshot.documents;
  documents.forEach((element) {
    if (element.data['productId'] == prdId) {
      revNumber++;
    }
  });
  return revNumber;
}

class Product extends StatefulWidget {

  DocumentSnapshot document;
  Product({this.document});
  @override
  _ProductState createState() => _ProductState();

}

class MyItem {
  MyItem({this.isExpanded: false, this.header, this.body});
  bool isExpanded;
  String header;
  String body;
}

class _ProductState extends State<Product> {
  Color notselected = Colors.white;
  Color selected = Colors.blue;
  IconData fav = Icons.favorite_border_outlined;
  List imgList;
  String image;
  String rate;
  int count = 0;
  int favNotificationCount = 0;
  int shoppingNotificationCount = 0;
  String description;
  List<MyItem> _items = <MyItem>[];
  List<MyItem> _items2 = <MyItem>[];
  List<Review> revList = [];
  int revCount = 0;

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpand) {
        setState(() {
          _items[index].isExpanded = !_items[index].isExpanded;
        });
      },
      children: _items.map<ExpansionPanel>((MyItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.header),
            );
          },
          body: ListTile(
            title: Text(item.body),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget _buildListPanel2() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpand) {
        setState(() {
          _items2[index].isExpanded = !_items2[index].isExpanded;
        });
      },
      children: _items2.map<ExpansionPanel>((MyItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.header),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Overall Rating",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_border_outlined,
                              color: Colors.grey[300]),
                          Icon(Icons.star_border_outlined,
                              color: Colors.grey[300]),
                          Icon(Icons.star_border_outlined,
                              color: Colors.grey[300]),
                          Icon(Icons.star_border_outlined,
                              color: Colors.grey[300]),
                          Icon(Icons.star_border_outlined,
                              color: Colors.grey[300])
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: Colors.blue[500],
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  title: Text("write review"),
                                  content: SingleChildScrollView(
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Text("Rate :"),
                                          Flexible(
                                            child: Row(children: [
                                              Container(
                                                width: 18,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.star_border_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => print("1"),
                                                ),
                                              ),
                                              Container(
                                                width: 18,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.star_border_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => print("1"),
                                                ),
                                              ),
                                              Container(
                                                width: 18,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.star_border_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => print("1"),
                                                ),
                                              ),
                                              Container(
                                                width: 18,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.star_border_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => print("1"),
                                                ),
                                              ),
                                              Container(
                                                width: 18,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.star_border_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () => print("1"),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 150,
                                        child: TextField(
                                            decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                filled: false,
                                                hintText: 'Add review')),
                                      ),
                                      RaisedButton(
                                        onPressed: () {},
                                        child: Text("send"),
                                        color: Colors.blue,
                                      )
                                    ]),
                                  ),
                                );
                              });
                        },
                        child: Text("Write a Review"),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: FutureBuilder(
                        future: getReviews(widget.document.documentID),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData)
                            return Center(child: CircularProgressIndicator());
                          else {
                            return Container(
                                height: 100,
                                child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Review rev = snapshot.data[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rev.reviewTitle,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(rev.review),
                                        Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    );
                                  },
                                ));
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    imgList = widget.document['images'];
    image = widget.document['image'];
    description = widget.document['description'].toString();
    
    _items.add(MyItem(header: "Description", body: description));
    _items.add(MyItem(header: "Deliveries and Returns", body: ""));
    _items2.add(MyItem(header: "Customer Reviews", body: ""));
    
    getReviews(widget.document.documentID).then((value) {
      for (var v in value) {
        revList.add(v);
        setState(() {
          revCount++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                //child: Image.network(widget.document['image']),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: selected),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                image = imgList[0];
                                selected = Colors.blue;
                                notselected = Colors.white;
                              });
                            },
                            child: Image.network(
                              imgList[0],
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: notselected),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                image = imgList[1];
                                notselected = Colors.blue;
                                selected = Colors.white;
                              });
                            },
                            child: Image.network(
                              imgList[1],
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                                translator.currentLanguage == 'en'
                                    ? widget.document['name'].toString()
                                    : widget.document['arabicName'].toString(),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Row(
                          children: [
                            Icon(Icons.star_border_outlined,
                                color: Colors.grey[300]),
                            Icon(Icons.star_border_outlined,
                                color: Colors.grey[300]),
                            Icon(Icons.star_border_outlined,
                                color: Colors.grey[300]),
                            Icon(Icons.star_border_outlined,
                                color: Colors.grey[300]),
                            Icon(Icons.star_border_outlined,
                                color: Colors.grey[300])
                          ],
                        ),
                        Text(
                          '(' + '$revCount' + ')',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            translator.translate("Reviews"),
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              print("rev");
                            },
                            child: Text(
                              translator.translate("Submit Reviews"),
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("SAR",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(widget.document['price'].toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(translator.translate("Avalible now "),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  color: Colors.white),
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  // Icons.favorite,
                                  color: Colors.black,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    if (count < 1) {
                                      count = 0;
                                    } else
                                      count--;
                                  })
                                },
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  color: Colors.white),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('$count'),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  color: Colors.white),
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  // Icons.favorite,
                                  color: Colors.black,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    if (count > 2) {
                                      count = 3;
                                    } else {
                                      count++;
                                    }
                                  })
                                },
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Limit 3",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.orange[900],
                          onPressed: () {
                            //getReviews(widget.document.documentID);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Add to Bag"),
                          ),
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  fav,
                                  // Icons.favorite,
                                  color: Colors.blue,
                                ),
                                onPressed: () => {
                                  setState(() {
                                    fav = Icons.favorite;
                                  })
                                },
                              ),
                              Text(
                                "Add to wishlist",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  // Icons.favorite,
                                  color: Colors.black,
                                ),
                                onPressed: () => print("share"),
                              ),
                              Text(
                                "share",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ])
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Icon(Icons.cake_outlined,
                                color: Colors.grey, size: 50),
                            Text(
                              "+6",
                              style: TextStyle(fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ages",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            )
                          ]),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Icon(Icons.add_shopping_cart_outlined,
                                color: Colors.grey, size: 50),
                            Text(
                              "800",
                              style: TextStyle(fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pieces",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            )
                          ]),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Icon(Icons.analytics_outlined,
                                color: Colors.grey, size: 50),
                            Text(
                              "414",
                              style: TextStyle(fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Item",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                  child: Column(
                children: [_buildListPanel(), _buildListPanel2()],
              )),
              Card(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Recommended For You',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                                items: snapshot.data.documents.map((product) {
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    print("aaaaa");
                                                  },
                                                  child: CachedNetworkImage(
                                                    height: 200,
                                                    imageUrl: product['image'],
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          product['name']
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "SAR ",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      product['price']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: RaisedButton(
                                                    color: Colors.orange[900],
                                                    onPressed: () {
                                                      print("j");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Text("Add to Bag"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ));
                                    },
                                  );
                                }).toList(),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
