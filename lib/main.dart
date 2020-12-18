import 'package:flutter/material.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/SpalshScreen/View/splash_screen.dart';
import 'package:focal_point/presentation/home.dart';
import 'package:focal_point/presentation/location_fetching.dart';
import 'package:focal_point/presentation/phone_number_screen.dart';
import 'package:focal_point/services/shared_prefs_ready_state.dart';
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
            home: FutureBuilder(
                future: _sharedPrefsReadyState.getAllDetails(userProvider),
                builder: (context, snapshot) {
                  if(snapshot.data == null)
                    return SplashScreen();
                  return (snapshot.hasData && snapshot.data) ? Home() : LocationFetchingScreen();
                }
            ),
          );
        }
    );
  }
}


/*
MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: FutureBuilder(
              future: SharedPrefsReadyState.getAllDetails(userProvider),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                  return SplashScreen();
                return (snapshot.hasData && snapshot.data) ? Home() : LocationFetchingScreen();
              }
          ),
        ),
 */

