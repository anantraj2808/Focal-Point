import 'package:flutter/cupertino.dart';
import 'package:focal_point/services/app_localizations.dart';

getTranslatedText(String key,BuildContext context){
  return AppLocalizations.of(context).translate(key);
}