import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';

Future createProfile(BuildContext context) async {
  Users userProvider = Provider.of<Users>(context,listen: false);
  String url = BASE_API + CREATE;

//  var professionsList = jsonEncode(userProvider.profession.map((e) => e.toJson()).toList());

  Map <String,dynamic> map = {
    "contactNumber" : userProvider.phoneNumber,
    "age" : userProvider.age,
    "gender" : userProvider.gender,
    "name" : userProvider.fullName,
    "city" : userProvider.city,
    "state" : userProvider.state,
    "occupations" :
    //["Plumber"],
    userProvider.profession,
    //professionsToJson(userProvider.profession),
    "language" : userProvider.language
  };

  print(jsonEncode(userProvider.profession));

  final http.Response response = await http.post(
    url,
    body: json.encode(map),
    headers: <String,String>{
      "Content-Type" : "application/json"
    }
  );
  print("Create Profile Response Code : " + response.statusCode.toString());
  var responseBody = jsonDecode(response.body);
  print("Create Profile Response Body : " + responseBody.toString());
  if (responseBody['sucess']){
    userProvider.setJWT(responseBody['token']);
    await SharedPrefs.setUserJWTSharedPrefs(responseBody['token']);
    userProvider.setUid(responseBody['data']['id']);
    return true;
  }
  return false;
}

professionsToJson(List<String> professionsList){
  for (int i=0 ; i<professionsList.length ; i++){
    professionsList[i] = "\"" +professionsList[i] + "\"";
  }
  return professionsList;
}