import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class StaticCarousel extends StatelessWidget {
  final String img1;
  final String img2;
  final String img3;

  const StaticCarousel({
    Key key,
    this.img1,
    this.img2,
    this.img3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 220,
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            NetworkImage(
              img1,
            ),
            NetworkImage(
              img2,
            ),
            NetworkImage(
              img3,
            ),
          ],
          autoplay: true,
          autoplayDuration: Duration(seconds: 5),
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 1),
          dotSize: 8.0,
          indicatorBgPadding: 10.0,
          dotIncreasedColor: Colors.black,
          dotBgColor: Colors.black.withOpacity(0),
        ),
      ),
    );
  }
}
