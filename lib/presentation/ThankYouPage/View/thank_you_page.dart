import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/HomePage/View/home_screen.dart';
import 'package:focal_point/styles/text_styles.dart';

import 'package:focal_point/presentation/home.dart';

class ThankYouPage extends StatefulWidget {

  final Job job;
  ThankYouPage({this.job});

  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/logo.jpg"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: RegularTextMedCenter("Thanks for applying for the job post of a " + widget.job.professionType, 22.0, DARK_BLUE),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: RegularTextMedCenter(widget.job.companyName+" will contact you soon.", 22.0, DARK_BLUE),
            ),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: RegularTextRegCenter("For more opportunities : ", 22.0, DARK_BLUE),
            ),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) => Home(isNewUser: false,)
                ), (route) => false);
              },
              child: Container(
                height: 50.0,
                width: 200.0,
                margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
                decoration: BoxDecoration(
                    color: DARK_BLUE,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: RegularTextReg(
                        "Apply to more Jobs",
                        //getTranslatedText("AppliedJobs",context),
                        20.0,WHITE)),
              ),
            ),
          ],
        )
      ),
    );
  }
}
