import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier{
  String _city = "";
  String _state = "";
  String _language = "";
  String _profession = "";

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

  void setProfession(String profession){
    _profession = profession;
    notifyListeners();
  }

  String get city => _city;
  String get state => _state;
  String get language => _language;
  String get profession => _profession;

}