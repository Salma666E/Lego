import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color containerColor;
  final String imgURL;
  final String title;
  final String description;
  final bool showBtn;

  const CategoryCard(
      {Key key,
      this.containerColor,
      this.imgURL,
      this.title,
      this.description,
      this.showBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imgURL, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ),
          showBtn
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Shop now'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
