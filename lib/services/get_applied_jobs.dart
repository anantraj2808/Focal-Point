import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/models/job.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<AppliedJob>> getAppliedJobs(String jwt) async {
  String url = BASE_API + APPLIED_JOBS;
  List<AppliedJob> appliedJobsList = [];

  http.Response response = await http.get(
      url,
    headers: <String, String>{
        "auth-token" : jwt,
    }
  );

  print("Get Applied Jobs status code: " + response.statusCode.toString());

  var responseBody = jsonDecode(response.body);
  var data = responseBody['jobs'];
  print("Data length = " + data.length.toString());
  print("Data = " + responseBody['jobs'].toString());
  for (int i=0 ; i<data.length ; i++){
    Job job = Job.fromJson(data[i]['job']);
    String status = data[i]['status'];
    appliedJobsList.add(AppliedJob(job: job,status: status));
  }

  return appliedJobsList;
}