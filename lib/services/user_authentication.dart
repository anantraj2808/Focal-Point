import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

//To check if user already exists in database
//If user exists => true, else =>false
Future<bool> getUser(BuildContext context) async {
  Users userProvider = Provider.of<Users>(context,listen: false);
  String api = BASE_API + GET_TOKEN + userProvider.phoneNumber;

  final http.Response response = await http.get(api);
  var responseData = jsonDecode(response.body);

  if (responseData['sucess']){
    userProvider.setJWT(responseData['token']);
    setUserDetails(context, responseData['token']);
    return true;
  } else{
    return false;
  }
}


//If user exists, set data into userProvider
Future setUserDetails(BuildContext context, String jwt) async {
  if (context == null) print("Context is null");
  Users userProvider = Provider.of<Users>(context,listen: false);
  String api = BASE_API + VIEW;

  final http.Response response = await http.get(
      api,
      headers: <String, String>{
        "auth-token": jwt
      }
  );
  var responseBody = jsonDecode(response.body);
  var responseData = responseBody['data'];

  print("Set Details response code : " + response.statusCode.toString());

  userProvider.setAllUserDetails(
      responseData['city'],
      responseData['state'],
      responseData['language'],
      responseData['gender'],
      responseData['name'],
      responseData['contactNumber'],
      responseData['age'],
      professions(responseData),
      responseData['_id'],
  );
  return true;
}

List<String> professions(responseData){
  List<String> professions = [];
  for (int i=0 ; i<responseData['occupations'].length ; i++){
    professions.add(responseData['occupations'][i]['occupation']);
  }
  return professions;
}