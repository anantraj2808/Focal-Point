import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/location_fetching.dart';
import 'package:provider/provider.dart';

import 'LanguageSelection/View/language_selection.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: Text("Your Profile",style: TextStyle(color: BLACK),),
        actions: [
          GestureDetector(
            onTap: (){
              userProvider.profession.clear();
              userProvider.setLanguage("");
              userProvider.setGender("");
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LocationFetchingScreen()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.exit_to_app,color: BLACK,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("City : "+userProvider.city),
            Text("State : "+userProvider.state),
            Text("Language : "+userProvider.language),
            Text("Professions : "+userProvider.profession.toString()),
            Text("Gender : "+userProvider.gender)
          ],
        ),
      ),
    );
  }
}
