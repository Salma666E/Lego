import 'package:flutter/material.dart';

class CategoryAvatar extends StatelessWidget {
  final String imgURL;
  final String name;
  const CategoryAvatar({
    Key key,
    this.imgURL,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            imgURL,
          ),
          radius: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(name),
        ),
      ],
    );
  }
}
