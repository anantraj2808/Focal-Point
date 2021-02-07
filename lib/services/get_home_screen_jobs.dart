import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/models/job.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';

Future<List<Job>> getHomeScreenJobs(BuildContext context, String jwt) async {
  if (context == null) print("Context is null");
  if (context != null) print("Context is not null");
  Users userProvider = Provider.of<Users>(context,listen: false);
  String url = BASE_API + GET_HOME_JOBS;

  print("Sending profession = " + convertToCamelCase(userProvider.profession).toString());
  List<Job> jobsList = [];
  Map<String,dynamic> map = {
    "professionType" : convertToCamelCase(userProvider.profession.toSet().toList())
  };

  final http.Response response = await http.post(
    url,
    body: json.encode(map),
    headers: <String,String>{
      "Content-Type" : "application/json",
      "auth-token" : jwt,
    }
  );

  print("Get Home Screen Jobs status code = " + response.statusCode.toString());

  var responseBody = jsonDecode(response.body);
  print("Get Home Screen Jobs response body = " + responseBody['data'].toString());
  var data = responseBody['data'];

  for (int i=0 ; i<data.length ; i++){
    for (int j=0 ; j<data[i].length ; j++){
      jobsList.add(Job.fromJson(data[i][j]));
    }
  }
  return jobsList;
}

convertToCamelCase(List<String> list){
  for (int i=0 ; i<list.length ; i++){
    list[i] = list[i].substring(0,1).toUpperCase() + list[i].substring(1);
  }
  return list;
}