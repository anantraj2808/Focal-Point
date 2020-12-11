import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:gscarousel/gscarousel.dart';
import 'package:provider/provider.dart';

class ProfessionSelectionScreen extends StatefulWidget {

  @override
  _ProfessionSelectionScreenState createState() => _ProfessionSelectionScreenState();
}

class _ProfessionSelectionScreenState extends State<ProfessionSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: GSCarousel(
                indicatorSize: const Size.square(8.0),
                indicatorActiveSize: const Size(18.0, 8.0),
                indicatorColor: WHITE,
                indicatorActiveColor: GREY,
                animationCurve: Curves.easeIn,
                contentMode: BoxFit.fill,
                images: [
                  for (int i=0 ; i<PROFESSION_BG_IMAGES.length ; i++)
                    AssetImage(PROFESSION_BG_IMAGES[i]),
                ].toList(),
              ),
            ),
            Container(
              height: height,
              width: width,
              color: BLACK_26,
            ),
          ],
        ),
      ),
    );
  }
}
