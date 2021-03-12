import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:toast/toast.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ReviewForm extends StatefulWidget {
  DocumentSnapshot document;
  ReviewForm({this.document});
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();

  final myconrollar = TextEditingController();
  final myconrollar2 = TextEditingController();

  int ovarallRating = 0;
  String productId = "";
  bool recommend = true;
  String recommends = "";

  String review = "";
  String reviewBody = "";

  IconData star1 = Icons.star_border_outlined;
  IconData star2 = Icons.star_border_outlined;
  IconData star3 = Icons.star_border_outlined;
  IconData star4 = Icons.star_border_outlined;
  IconData star5 = Icons.star_border_outlined;

  @override
  void dispose() {
    myconrollar.dispose();
    myconrollar2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.document['image'],
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                //child: Image.network(widget.document['image']),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translator.translate('Rate'),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(star1),
                        onPressed: () {
                          setState(() {
                            ovarallRating = 1;
                            star1 = Icons.star_rate;
                            star2 = Icons.star_border_outlined;
                            star3 = Icons.star_border_outlined;
                            star4 = Icons.star_border_outlined;
                            star5 = Icons.star_border_outlined;
                          });
                        }),
                    IconButton(
                        icon: Icon(star2),
                        onPressed: () {
                          setState(() {
                            ovarallRating = 2;
                            star1 = Icons.star_rate;
                            star2 = Icons.star_rate;
                            star3 = Icons.star_border_outlined;
                            star4 = Icons.star_border_outlined;
                            star5 = Icons.star_border_outlined;
                          });
                        }),
                    IconButton(
                        icon: Icon(star3),
                        onPressed: () {
                          setState(() {
                            ovarallRating = 3;
                            star1 = Icons.star_rate;
                            star2 = Icons.star_rate;
                            star3 = Icons.star_rate;
                            star4 = Icons.star_border_outlined;
                            star5 = Icons.star_border_outlined;
                          });
                        }),
                    IconButton(
                        icon: Icon(star4),
                        onPressed: () {
                          setState(() {
                            ovarallRating = 4;
                            star1 = Icons.star_rate;
                            star2 = Icons.star_rate;
                            star3 = Icons.star_rate;
                            star4 = Icons.star_rate;
                            star5 = Icons.star_border_outlined;
                          });
                        }),
                    IconButton(
                        icon: Icon(star5),
                        onPressed: () {
                          setState(() {
                            ovarallRating = 5;
                            star1 = Icons.star_rate;
                            star2 = Icons.star_rate;
                            star3 = Icons.star_rate;
                            star4 = Icons.star_rate;
                            star5 = Icons.star_rate;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  translator.translate('WriteReviewtitle'),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: myconrollar,
              style: TextStyle(fontSize: 10),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(3.0),
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
                hintText: "",
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (rev) {
                if (rev.isEmpty) {
                  return 'Review should not be empty ';
                } else {
                  return null;
                }
              },
              onSaved: (rev) => review= rev,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  translator.translate('WriteReview'),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: myconrollar2,
              style: TextStyle(fontSize: 10),
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(3.0),
                fillColor: Colors.white,
                filled: true,
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
                hintText: "",
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (revbody) {
                if (revbody.isEmpty) {
                  return 'Review should not be empty ';
                } else {
                  return null;
                }
              },
              onSaved: (revbody) => reviewBody = revbody,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  translator.translate('recommend'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: "true",
                        groupValue: recommends,
                        onChanged: (val) {
                          setState(() {
                            recommends = val;
                            print(recommends);
                          });
                        }),
                    Text(
                      translator.translate('Yes'),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "false",
                        groupValue: recommends,
                        onChanged: (val) {
                          setState(() {
                            recommends = val;
                            print(recommends);
                          });
                        }),
                    Text(
                      translator.translate('No'),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              print(widget.document.documentID);
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Firestore.instance.collection("Reviews").add({
                "OverallRating": ovarallRating,
                "productId": widget.document.documentID,
                "recommend": recommend,
                "reviewTitle": myconrollar.text,
                "review": myconrollar2.text
              }).then((value) => print(value.documentID));
              Toast.show(('Thank you for sharing your experince'), context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
             }
            },
            child: Text(translator.translate("Send")),
          )
        ]),
      )),
    );
  }

  void handleButtonChang(String value) {
    setState(() {
      if (value == "true") {
        recommend = true;
        print(recommend);
      } else if (value == "false") {
        recommend = false;
        print(recommend);
      }
    });
  }
}
