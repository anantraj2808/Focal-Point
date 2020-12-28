import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier{
  String _city = "";
  String _state = "";
  String _language = "";
  String _gender = "";
  String _fullName = "";
  String _phoneNumber = "";
  String _age = "";
  bool _isUserVerified = false;
  String _userJWT = "";
  String _uid = "";
  List<String> _professions = [];

  Users();

  void setLocation(String city, String state){
    _city = city;
    _state = state;
    notifyListeners();
  }

  void setLanguage(String language){
    _language = language;
    notifyListeners();
  }

  void setProfessions(List<String> professions){
    _professions = professions;
    notifyListeners();
  }

  void addProfession(String profession){
    _professions.add(profession);
    _professions.toSet().toList();
    notifyListeners();
  }

  void removeProfession(String profession){
    _professions.toSet().toList();
    _professions.remove(profession);
    notifyListeners();
  }

  void setGender(String gender){
    _gender = gender;
    notifyListeners();
  }

  void setFullName(String name){
    _fullName = name;
    notifyListeners();
  }

  void setPhoneNumber(String number){
    _phoneNumber = number;
    notifyListeners();
  }

  void setAge(String age){
    _age = age;
    notifyListeners();
  }

  void setUid(String uid){
    _uid = uid;
    notifyListeners();
  }

  void setAllUserDetails(city,state,language,gender,fullName,phoneNumber,age,List<String> professions,uid){
    _city = city;
    _state = state;
    _language = language;
    _gender = gender;
    _fullName = fullName;
    _phoneNumber = phoneNumber;
    _age = age;
    _uid = uid;
    _professions = professions;
    notifyListeners();
  }

  void setIsUserVerifiedStatus(bool isUserVerified){
    _isUserVerified = isUserVerified;
    notifyListeners();
  }

  void setJWT(String jwt){
    _userJWT = jwt;
    notifyListeners();
  }

  String get city => _city;
  String get state => _state;
  String get language => _language;
  String get gender => _gender;
  String get fullName => _fullName;
  String get phoneNumber => _phoneNumber;
  String get age => _age;
  String get userJWT => _userJWT;
  String get uid => _uid;
  bool get isUserVerified => _isUserVerified;
  List<String> get profession => _professions;

}