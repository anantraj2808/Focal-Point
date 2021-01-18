import 'dart:convert';

import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/job.dart';
import 'package:http/http.dart' as http;

Future<List<Job>> searchJobs(List<String> professionList, String city, String state, String jwt) async {
  String url = BASE_API + SEARCH_JOBS;
  if(city == "Select a city") city = "";
  if(state == "Select a state") state = "";

  print("City" + city);
  print("State" + state);
  print("Professions" + professionList.toString());

  List<Job> jobsList = [];
  
  Map<String, dynamic> map =
  {
    "professionType" : professionList,
    "location" : {
      "city" : city,
      "state" : state
    }
  };
  
  final http.Response response = await http.post(
    url,
    body: json.encode(map),
    headers: <String,String>{
      'Content-Type' : "application/json",
      'auth-token' : jwt
    }
  );

  print("Search Response code = " + response.statusCode.toString());

  if(response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    var data = responseBody['data'];
    print("Search Data = " + data.toString());
    for (int i=0 ; i<data.length ; i++){
      for (int j=0 ; j<data[i].length ; j++){
        jobsList.add(Job.fromJson(data[i][j]));
      }
    }
    return jobsList;
  }

  else {
    return [];
  }
}