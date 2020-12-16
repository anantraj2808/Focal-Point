import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'language_selection.dart';

class LocationFetchingScreen extends StatefulWidget {
  @override
  _LocationFetchingScreenState createState() => _LocationFetchingScreenState();
}

class _LocationFetchingScreenState extends State<LocationFetchingScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  Users user = Users();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    openLocationService();
  }

  void openLocationService() async {
    final AndroidIntent intent = new AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    );
    await intent.launch();
  }

  _fetchLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        user.setLocation(place.locality, place.administrativeArea);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return user.city.isEmpty ? Scaffold(
            body: SafeArea(
                child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  child: Image(
                    image: AssetImage(LOCATION_BG_IMAGE),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  color: BLACK_26,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Getting Location...",
                          style: TextStyle(color: WHITE, fontSize: 17.5),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        CircularProgressIndicator(
                          backgroundColor: WHITE,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
          )
        : LanguageSelectionScreen(user: user);
  }
}
