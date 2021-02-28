import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

Widget slider() {
  return Center(
    child: Container(
      height: 230.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/40172.jpeg'),
          AssetImage('assets/images/sortatr2.png'),
          AssetImage('assets/images/SMS-General-Promo-Block-Standard.jpeg'),
          AssetImage('assets/images/853915.jpeg'),
          AssetImage('assets/images/75967-PDP-202006-Hero3-Standard-Small.jpeg')
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 2),
        dotSize: 10.0,
        indicatorBgPadding: 10.0,
        dotBgColor: Colors.black,
      ),
    )
  );
}
