import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/presentation/AppliedJobs/Widget/applied_jobs_card.dart';

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
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.appliedJobsList.length,
          itemBuilder: (context,index){
            return appliedJobCard(widget.appliedJobsList[index]);
          },
        ),
      ),
    );
  }
}
