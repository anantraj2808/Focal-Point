import 'package:flutter/widgets.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsReadyState{
  static String _language = "";

  Future<bool> getAllDetails(BuildContext context) async {
    _language = await SharedPrefs.getLanguageSharedPrefs();
  }

  String get language => _language;
}