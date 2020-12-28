import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/location_fetching.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();
  bool isUserLoggedInBool = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: width,
                margin: EdgeInsets.only(top: 30.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: userProvider.gender == "Male" ? LIGHT_BLUE : LIGHT_PINK,
                              shape: BoxShape.circle
                          ),
                          child: Image.asset("assets/images/${userProvider.gender.toLowerCase()}.png"),
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RegularTextReg("Name : ", 18.0, BLUE_GREY),
                            RegularTextMed(userProvider.fullName, 20.0, DARK_BLUE)
                          ],
                        ),
                        userProvider.city != null ? Text("City : "+userProvider.city) : Container(),
                        userProvider.state != null ? Text("State : "+userProvider.state) : Container(),
                        userProvider.fullName != null ? Text("Name : "+userProvider.fullName) : Container(),
                        userProvider.phoneNumber != null ? Text("Phone No : "+userProvider.phoneNumber) : Container(),
                        userProvider.gender != null ? Text("Gender : "+userProvider.gender) : Container(),
                        userProvider.age != null ? Text("Age : "+userProvider.age) : Container(),
                        userProvider.language != null ? Text("Language : "+userProvider.language) : Container(),
                        //userProvider.isUserVerified != null ? Text("Is Verified : "+userProvider.isUserVerified.toString()) : Container(),
                        userProvider.profession.isNotEmpty ? Text("Professions : "+userProvider.profession.toString()) : Container(),
                        userProvider.uid != null ? Text("UID : "+userProvider.uid) : Container(),
                        userProvider.userJWT != null ? Text("JWT : "+userProvider.userJWT) : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            )
    );
  }
}
