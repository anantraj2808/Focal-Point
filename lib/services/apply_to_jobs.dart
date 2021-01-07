import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';

Future applyToJob(String jobId, String jwt) async {
  String url = BASE_API + APPLY_TO_JOBS;

  print("Job ID : " + jobId);
  print("JWT : " + jwt);

  Map<String,dynamic> map = {
    "job" : jobId
  };

  final http.Response response = await http.post(
      url,
      body: json.encode(map),
      headers: <String,String>{
        "Content-Type" : "application/json",
        "auth-token" : jwt
      }
  );

  print("Apply to jobs response code : " + response.statusCode.toString());

  if (response.statusCode == 200){
    return true;
  }
  return false;

}