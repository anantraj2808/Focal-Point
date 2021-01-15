import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';

Widget appliedJobCard(Job job){

  job.professionType = job.professionType.substring(0,1).toUpperCase() + job.professionType.substring(1);
  int globalIndex = PROFESSION_LIST.indexOf(job.professionType);

  return Container(
    child: ListTile(
      leading: Icon(PROFESSION_ICON_LIST[globalIndex]),
      title: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(

            )
          ],
        ),
      ),
    ),
  );
}