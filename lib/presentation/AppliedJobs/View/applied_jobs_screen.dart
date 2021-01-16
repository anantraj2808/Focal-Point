import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/presentation/AppliedJobs/Widget/applied_jobs_card.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/text_styles.dart';

class AppliedJobsScreen extends StatefulWidget {

  final List<AppliedJob> appliedJobsList;
  AppliedJobsScreen({this.appliedJobsList});

  @override
  _AppliedJobsScreenState createState() => _AppliedJobsScreenState();
}

class _AppliedJobsScreenState extends State<AppliedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: DARK_BLUE,size: 30.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: WHITE,
        centerTitle: true,
        title: RegularTextReg("Applied Jobs",
            22.0,
            DARK_BLUE),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 5.0),
          child: ListView.builder(
            itemCount: widget.appliedJobsList.length,
            itemBuilder: (context,index){
              return appliedJobCard(widget.appliedJobsList[index]);
            },
          ),
        ),
      ),
    );
  }
}
