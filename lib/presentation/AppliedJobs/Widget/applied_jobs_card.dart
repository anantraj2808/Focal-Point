import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/styles/status_color.dart';
import 'package:focal_point/styles/text_styles.dart';

Widget appliedJobCard(AppliedJob appliedJob){

  appliedJob.job.professionType = appliedJob.job.professionType.substring(0,1).toUpperCase() + appliedJob.job.professionType.substring(1);
  int globalIndex = PROFESSION_LIST.indexOf(appliedJob.job.professionType);

  Job job = appliedJob.job;

  return Container(
    margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
    child: Card(
      elevation: 5.0,
      shadowColor: GREY,
      child: ListTile(
        leading: Container(
          width: 30.0,
          alignment: Alignment.center,
          child: Icon(PROFESSION_ICON_LIST[globalIndex],size: 26.0,color: DARK_BLUE,)),
        title: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularTextMed(job.professionType, 22.0, DARK_BLUE),
                  RegularTextReg("\(" + job.dutyType + "\)", 16.0, DARK_BLUE)
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RegularTextReg(job.companyName, 16.0, DARK_BLUE)
              ),
              SizedBox(height: 4.0,),
              Container(
                alignment: Alignment.centerLeft,
                child: RegularTextReg("₹ " + job.salary + "/" + job.payBasis,16.0,DARK_BLUE),
              ),
              SizedBox(height: 4.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RegularTextReg("Status : ", 16.0, DARK_BLUE),
                  RegularTextMed(appliedJob.status, 16.0, getStatusColor(appliedJob.status))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}