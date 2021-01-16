import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/JobDescription/View/job_description_page.dart';
import 'package:focal_point/presentation/SpalshScreen/View/splash_screen.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget jobListTile(Job job, int globalIndex, int colorIndex, BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      print(job.professionType);
      print(job.minimumQualification);
      print(job.companyName);
      print(job.description);
      print(job.dutyType);
      print(job.languageRequired);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDescription(
                    job: job,
                  ))
      );
    },
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: Card(
        color: LIGHT_COLOR_LIST[colorIndex % 4],
        elevation: 2.0,
        shadowColor: DARK_BLUE,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: (Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: RegularTextMedOverflow(
                      job.salary + " " + job.payBasis, 18.0, BLACK,1)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      PROFESSION_ICON_LIST[globalIndex],
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 7.5,
                    ),
                    RegularTextReg(job.professionType, 16.0, BLACK),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RegularTextRegOverflow(job.companyName, 16.0, BLACK, 1),
                //padding: EdgeInsets.only(bottom: 5.0),
              ),
              Divider(
                color: GREY,
                indent: 5.0,
                endIndent: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                      child: RegularTextRegOverflow(
                          job.city + ", " + job.state, 14.0, BLACK, 1)),
                ],
              ),
              SizedBox(
                height: 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    size: 16.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  RegularTextReg(job.dutyType, 14.0, BLACK),
                ],
              ),
            ],
          )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
