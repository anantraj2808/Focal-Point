import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

  static final String languageKeySharedPrefs = "LANGUAGE";
  static final String professionKeySharedPrefs = "PROFESSIONS";
  static final String userLoggedInKeySharedPrefs = "IS_USER_LOGGED_IN";
  static final String cityKeySharedPrefs = "CITY";
  static final String genderKeySharedPrefs = "GENDER";
  static final String stateKeySharedPrefs = "STATE";
  static final String ageSharedPrefs = "AGE";
  static final String fullNameSharedPrefs = "FULL_NAME";
  static final String phoneNumberSharedPrefs = "PHONE_NUMBER";
  static final String isUserVerifiedSharedPrefs = "IS_USER_VERIFIED";

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

  static Future setGenderSharedPrefs(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(genderKeySharedPrefs, gender);
  }

  static Future setAgeSharedPrefs(String age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(ageSharedPrefs, age);
  }
  static Future setFullNameSharedPrefs(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(fullNameSharedPrefs, name);
  }

  static Future setPhoneNumberSharedPrefs(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(phoneNumberSharedPrefs, number);
  }

  static setUserVerifiedStatus(bool isUserVerified) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(isUserVerifiedSharedPrefs, isUserVerified);
  }




  //Getter methods

  static Future getIsUserLoggedInSharedPrefs() async {
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

  static Future getGenderSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(genderKeySharedPrefs);
  }

  static Future getAgeSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ageSharedPrefs);
  }

  static Future getFullNameSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fullNameSharedPrefs);
  }

  static Future getPhoneNumberSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneNumberSharedPrefs);
  }

  static Future getIsUserVerifiedSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isUserVerifiedSharedPrefs);
  }
}