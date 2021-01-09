import 'package:flutter/cupertino.dart';
import 'package:focal_point/services/app_localizations.dart';
import 'package:focal_point/services/shared_preferences.dart';

getTranslatedText(String key,BuildContext context){
  return AppLocalizations.of(context).translate(key);
}

getLangCode() async {
  String language = await SharedPrefs.getLanguageSharedPrefs();
  switch(language){
    case "English" : return "en";
    case "हिन्दी" : return "hi";
    case "मराठी" : return "mr";
    default : return "en";
  }
}