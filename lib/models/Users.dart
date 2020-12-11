import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier{
  String _city = "";
  String _state = "";
  String _language = "";
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

  void addProfession(String profession){
    _professions.add(profession);
    _professions.toSet().toList();
    notifyListeners();
  }

  String get city => _city;
  String get state => _state;
  String get language => _language;
  List<String> get profession => _professions;

}