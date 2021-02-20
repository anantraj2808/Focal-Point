import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/AppliedJobs/Widget/applied_jobs_card.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/no_job_found.dart';
import 'package:focal_point/styles/text_styles.dart';

class AppliedJobsScreen extends StatefulWidget {

  final List<AppliedJob> appliedJobsList;
  final String title;
  AppliedJobsScreen({this.appliedJobsList,this.title});

  @override
  _AppliedJobsScreenState createState() => _AppliedJobsScreenState();
}

class _AppliedJobsScreenState extends State<AppliedJobsScreen> {

  List<AppliedJob> jobsList = [];

  @override
  void initState() {
    super.initState();
    if(widget.title == "Accepted Jobs"){
      for (int i=0 ; i<widget.appliedJobsList.length ; i++){
        if (widget.appliedJobsList[i].status == "Accepted"){
          jobsList.add(widget.appliedJobsList[i]);
        }
      }
    }
    else {
      jobsList = widget.appliedJobsList;
    }
  }

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
        title: RegularTextReg(widget.title,
            22.0,
            DARK_BLUE),
      ),
      body: SafeArea(
        child: jobsList.length != 0 ? Container(
          padding: EdgeInsets.only(top: 5.0),
          child: ListView.builder(
            itemCount: jobsList.length,
            itemBuilder: (context,index){
              return appliedJobCard(jobsList[index]);
            },
          ),
        ) : Center(child: noJobFound()),
      ),
    );
  }
}
