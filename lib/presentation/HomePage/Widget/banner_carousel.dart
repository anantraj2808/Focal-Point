import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/colors.dart';

Widget carouselContainer(){
  return Carousel(
    borderRadius: true,
    dotBgColor: TRANSPARENT,
    dotSize: 3,
    images: [
      Container(
        child: Image.asset('assets/images/banner1.jpg',
            fit: BoxFit.fill),
      ),
      Container(
        child: Image.asset('assets/images/banner2.jpg',
            fit: BoxFit.fill),
      ),
      Container(
        child: Image.asset('assets/images/banner3.jpg',
            fit: BoxFit.fill),
      ),
    ],
  );
}