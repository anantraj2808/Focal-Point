import 'package:focal_point/constants/apis.dart';
import 'package:focal_point/models/Users.dart';

Future<String> createProfile(Users userProvider){
  String url = BASE_API + CREATE;
  Map <String,dynamic> map = {
    "contactNumber" : userProvider.phoneNumber,
    "age" : userProvider.age,
    "gender" : userProvider.gender,
    "name" : userProvider.fullName,
    "city" : userProvider.city,
    "state" : userProvider.state,
    "occupations" : userProvider.profession.toString(),
  };
}