import 'package:flutter/material.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/OTPVerificationScreen/View/otp_verification_screen.dart';
import 'package:focal_point/presentation/SpalshScreen/View/splash_screen.dart';
import 'package:focal_point/presentation/home.dart';
import 'package:focal_point/presentation/location_fetching.dart';
import 'package:focal_point/presentation/phone_number_screen.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/services/shared_prefs_ready_state.dart';
import 'package:focal_point/services/user_authentication.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPrefsReadyState _sharedPrefsReadyState = SharedPrefsReadyState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Users()),
        ],
        builder: (context, _) {
          final Users userProvider = Provider.of<Users>(context, listen: false);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Focal Point',
            home:
//            OTPVerificationScreen(),
            FutureBuilder(
                future: SharedPrefs.getIsUserLoggedInSharedPrefs(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    return SplashScreen();
//                  if(snapshot.data == null)
//                    return OTPVerificationScreen();
                  return (snapshot.hasData && snapshot.data) ? Home(isNewUser: false,) : OTPVerificationScreen();
                }
            ),
          );
        }
    );
  }
}