import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/location_fetching.dart';
import 'package:focal_point/services/edit_details.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  final _formKey = GlobalKey<FormState>();
  bool isUserLoggedInBool = false;
  bool isEditable = false;
  TextEditingController nameTEC = TextEditingController();
  TextEditingController phoneNoTEC = TextEditingController();
  TextEditingController cityTEC = TextEditingController();
  TextEditingController stateTEC = TextEditingController();
  TextEditingController ageTEC = TextEditingController();
  TextEditingController genderTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    nameTEC.text = userProvider.fullName;
    phoneNoTEC.text = userProvider.phoneNumber;
    cityTEC.text = userProvider.city;
    stateTEC.text = userProvider.state;
    genderTEC.text = userProvider.gender;
    ageTEC.text = userProvider.age;
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: RegularTextReg("Your Profile", 22.0, BLACK),
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                print(isEditable.toString());
                isEditable = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.edit,color: DARK_BLUE,
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
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("Name : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.fullName, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              onChanged: (String val){
                                userProvider.setFullName(val);
                              },
                              controller: nameTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid name";
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "Name",
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("Phone No. : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.phoneNumber, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              controller: phoneNoTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid Phone number";
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "Phone Number",
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("City : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.city, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              controller: cityTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid city";
                                return null;
                              },
                              onChanged: (String val){
                                userProvider.setLocation(val, userProvider.state);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "City",
                                hintText: "City",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("State : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.state, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              controller: stateTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid state";
                                return null;
                              },
                              onChanged: (String val){
                                userProvider.setLocation(userProvider.city, val);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "State",
                                hintText: "State",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("Gender : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.gender, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              controller: genderTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid gender";
                                return null;
                              },
                              onChanged: (String val){
                                userProvider.setGender(val);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "Gender",
                                hintText: "Gender",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        Column(
                          children: [
                            !isEditable ? Container(
                                width: width,
                                color: WHITE,
                                padding: EdgeInsets.symmetric(horizontal: 50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RegularTextReg("Age : ", 18.0, BLUE_GREY),
                                    Spacer(),
                                    RegularTextMed(userProvider.age, 20.0, DARK_BLUE),
                                  ],
                                )
                            ) :
                            TextFormField(
                              controller: ageTEC,
                              validator: (String value){
                                if (value.isEmpty) return "Enter valid age";
                                return null;
                              },
                              onChanged: (String val){
                                userProvider.setAge(val);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'googlesansmed'),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      7.0),
                                  borderSide: new BorderSide(),
                                ),
                                fillColor: Colors.black54,
                                labelText: "Age",
                                hintText: "Age",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'googlesansreg',
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Divider(color: DARK_GREY,endIndent: 10.0,indent: 10.0,),
                            SizedBox(height: 8.0,),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(_formKey.currentState.validate() && isEditable){
                              bool returnBool;
                              returnBool = await editDetails(context);
                              print("Return Bool : "+returnBool.toString());
                            }
                          },
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isEditable ? DARK_BLUE : GREY,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: RegularTextReg("Save Details", 18.0, WHITE),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
    );
  }
}


/*
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
 */