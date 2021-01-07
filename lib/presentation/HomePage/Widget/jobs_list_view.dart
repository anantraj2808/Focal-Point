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
        Container(
          padding: EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
            child: Text(PROFESSION_LIST[globalIndex],style: TextStyle(fontSize: 25.0,fontFamily: GOOGLE_SANS_MED),)),
        //SizedBox(height: 8.0,),
        Container(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            childAspectRatio: 1,
            crossAxisCount: 2,
            children: List.generate(jobList.length, (index){
              return jobListTile(jobList[index],globalIndex,colorIndex,context);
            }),
          ),
        ),
        SizedBox(height: 5.0,),
        Divider(color: DARK_GREY,endIndent: 5.0,indent: 5.0,),
        SizedBox(height: 5.0,),
      ],
    )
  );
}

getTranslatedString(String text) async {

  final translator = GoogleTranslator();

  String convertedString = "";
  convertedString = await translator.translate(text,to: 'mr').toString();
  return convertedString;
}