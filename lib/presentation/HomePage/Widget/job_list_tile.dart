import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/JobDescription/View/job_description_page.dart';
import 'package:focal_point/presentation/SpalshScreen/View/splash_screen.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget jobListTile(Job job, int globalIndex, int colorIndex, BuildContext context) {
  var ht = MediaQuery.of(context).size.height;
  var wd = MediaQuery.of(context).size.width;
  Color textColor = BLACK;
  Color shadyColor = LIGHT_SHADY_COLOR_LIST[colorIndex%4];
  Color backgroundColor = SHADY_COLOR_LIST[colorIndex%4];
  int professionIndex = PROFESSION_LIST.indexOf(job.professionType);
  String payBasis = job.payBasis == "Per Day" ? " / day" : "/ month";
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => JobDescription(job: job,)
        ));
      },
      child: Material(
        color: backgroundColor,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: 235.0,
          padding: EdgeInsets.all(ht*0.018),
          child: Container(
            height: 100.0,
            width: 235.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: shadyColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      //width: 90.0,
                      child: RegularTextMedCenter("₹ " + job.salary + " " + payBasis, 16.0, textColor),
                    ),
                    SizedBox(width: ht*0.013,),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: shadyColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: RegularTextRegCenter(job.dutyType, 14.0, textColor),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 5.0,),
                    Flexible(child: RegularTextRegOverflow(job.companyName, 16.0, BLACK, 1))
                  ],
                ),
                SizedBox(height: 6.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 5.0,),
                    Flexible(child: RegularTextRegOverflow("${job.city}, ${job.state}", 16.0, BLACK, 1))
                  ],
                ),
                SizedBox(height: 6.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.language),
                    SizedBox(width: 5.0,),
                    Flexible(child: RegularTextRegOverflow("Required : ${job.languageRequired}", 16.0, BLACK, 1))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
