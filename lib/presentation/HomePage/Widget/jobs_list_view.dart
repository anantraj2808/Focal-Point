import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:translator/translator.dart';
import 'job_list_tile.dart';

Widget jobsListView(int globalIndex, List<Job> jobList, int colorIndex, BuildContext context){

  return Container(
    child:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                child: Icon(PROFESSION_ICON_LIST[globalIndex])),
            Container(
                padding: EdgeInsets.only(left: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(PROFESSION_LIST[globalIndex],style: TextStyle(fontSize: 25.0,fontFamily: GOOGLE_SANS_MED),)),
          ],
        ),
        SizedBox(height: 8.0,),
        Container(
          height: 175,
          child: ListView.builder(
            itemCount: jobList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                  margin: EdgeInsets.only(left: 8.0,right: 8.0),
                child: jobListTile(jobList[index],globalIndex,colorIndex,context));
            },
          ),
        ),
        SizedBox(height: 5.0,),
//        Divider(color: GREY,endIndent: 5.0,indent: 5.0,),
        SizedBox(height: 5.0,),
      ],
    )
  );
}