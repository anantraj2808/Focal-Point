import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget jobListTile(Job job, BuildContext context){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.all(5.0),
    child: Card(
      elevation: 2.0,
      shadowColor: BLUE_GREY,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: (
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: RegularTextReg(job.salary, 18.0, BLACK)
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RegularTextReg(job.professionType, 16.0, BLACK),
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RegularTextReg(job.companyName, 16.0, BLACK),
              //padding: EdgeInsets.only(bottom: 5.0),
            ),
            Divider(color: GREY,indent: 5.0,endIndent: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on,size: 16.0,),
                SizedBox(width: 5.0,),
                RegularTextReg(job.city + ", " + job.state,14.0,BLACK),
              ],
            ),
            SizedBox(height: 2.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.shopping_bag,size: 16.0,),
                SizedBox(width: 5.0,),
                RegularTextReg(job.dutyType,14.0,BLACK),
              ],
            ),
          ],
        )
        ),
      ),
    ),
  );
}