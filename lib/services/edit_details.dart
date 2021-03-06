import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/services/user_authentication.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:provider/provider.dart';

editDetails(BuildContext context) async {

  Users userProvider = Provider.of<Users>(context,listen: false);

  String jwt = await SharedPrefs.getUserJWTSharedPrefs();
  print("JWT = " + jwt);
  String url = BASE_API + EDIT;

  Map <dynamic,dynamic> map = {
    "city" : userProvider.city,
    "state" : userProvider.state,
    "occupations" : userProvider.profession,
    "age" : userProvider.age,
    "gender" : userProvider.gender,
    "name" : userProvider.fullName,
    "language" : userProvider.language
  };

  print("Edited jobs = "+json.encode(userProvider.profession));

  final http.Response response = await http.post(
      url,
      body: json.encode(map),
      headers: <String,String>{
        "Content-Type" : "application/json",
        "auth-token" : jwt
      }
  );
  print("URL : " + url);
  print("User JWT : " + jwt);
  print("Edit Details response code : " + response.statusCode.toString());
  var responseBody = jsonDecode(response.body);
  print("Edit Details response body : " + responseBody.toString());
  if (response.statusCode == 200){
    //setUserDetails(context, jwt);
    return true;
  }
  return false;
}