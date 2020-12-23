import 'package:flutter/widgets.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsReadyState with ChangeNotifier{
  static bool _isUserLoggedIn = false;
  static bool _isUserVerified = false;
  static String _city = "";
  static String _state = "";
  static String _language = "";
  static String _gender = "";
  static List<String> _professionsList = [];

  Future<bool> getAllDetails(Users userProvider) async {
    _isUserLoggedIn = await SharedPrefs.getIsUserLoggedInSharedPrefs();
    if (_isUserLoggedIn == null) return false;
    if (!_isUserLoggedIn) return false;
    _isUserVerified = await SharedPrefs.getIsUserVerifiedSharedPrefs();
    _city = await SharedPrefs.getCitySharedPrefs();
    _state = await SharedPrefs.getStateSharedPrefs();
    _language = await SharedPrefs.getLanguageSharedPrefs();
    _gender = await SharedPrefs.getGenderSharedPrefs();
    _professionsList = await SharedPrefs.getProfessionsListSharedPrefs();
    userProvider.setLanguage(_language);
    userProvider.setLocation(_city,_state);
    userProvider.setProfessions(_professionsList);
    userProvider.setGender(_gender);
    notifyListeners();
    return true;
  }


  //Getter methods

//  bool get isUserLoggedIn => _isUserLoggedIn;
//  String get city => _city;
//  String get state => _state;
//  String get language => _language;
//  List<String> get professionsList => _professionsList;

}