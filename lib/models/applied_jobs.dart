import 'package:focal_point/models/job.dart';

class AppliedJob{
  Job job;
  String status;

  AppliedJob({this.job, this.status});

  factory AppliedJob.fromJson(Map<String,dynamic> json){
    return AppliedJob(
      job: json['job'] as Job,
      status: json['status']
    );
  }
}