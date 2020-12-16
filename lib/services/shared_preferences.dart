import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

  static final String languageKeySharedPrefs = "LANGUAGE";
  static final String professionKeySharedPrefs = "PROFESSIONS";
  static final String userLoggedInKeySharedPrefs = "ISUSERLOGGEDIN";
  static final String cityKeySharedPrefs = "CITY";
  static final String stateKeySharedPrefs = "STATE";

  //Setter methods

  static Future setLoggedInStatusSharedPrefs(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedInKeySharedPrefs, isUserLoggedIn);
  }

  static Future setCitySharedPrefs(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(cityKeySharedPrefs, city);
  }

  static Future setStateSharedPrefs(String state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(stateKeySharedPrefs, state);
  }

  static Future setLanguageSharedPrefs(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(languageKeySharedPrefs, language);
  }

  static Future setProfessionsSharedPrefs(List<String> professionsList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(professionKeySharedPrefs, professionsList);
  }




  //Getter methods

  static Future isUserLoggedInSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKeySharedPrefs);
  }

  static Future getLanguageSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKeySharedPrefs);
  }

  static Future getProfessionsListSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(professionKeySharedPrefs);
  }

  static Future getCitySharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(cityKeySharedPrefs);
  }

  static Future getStateSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stateKeySharedPrefs);
  }
}