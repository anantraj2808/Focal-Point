import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/presentation/PersonalDetailsForm/Widget/custom_dialog_otp.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:focal_point/models/Users.dart';
import 'package:provider/provider.dart';

import '../../location_fetching.dart';

class PersonalDetailsForm extends StatefulWidget {
  @override
  _PersonalDetailsFormState createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberTEC = TextEditingController();
  TextEditingController fullNameTEC = TextEditingController();
  TextEditingController ageTEC = TextEditingController();
  bool checkedStatus = false;
  bool buttonClicked = false;
  String termsAndConditionsText = LOREM_IPSUM;

  @override
  void initState() {
    super.initState();
    buttonClicked = false;
  }

//  sendOTP(BuildContext context){
//    //TODO
//    showDialog(context: context,
//        builder: (context){
//          return OTPDialog(fullNameTEC.text,ageTEC.text,phoneNumberTEC.text);
//        }
//    );
//  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: RegularTextReg("Enter Personal Details", 22.0, BLACK),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: width,
              margin: EdgeInsets.only(top: 50.0),
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
                          color: WHITE,
                          shape: BoxShape.circle
                        ),
                        child: Image.asset("assets/images/circular_logo.png"),
                      ),
                      SizedBox(height: 30.0,),
                      TextFormField(
                        validator: (String value){
                          if (value.length <= 2) return "Enter a valid name";
                          else return null;
                        },
                        controller: fullNameTEC,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'googlesansmed'
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                7.0),
                            borderSide: new BorderSide(),
                          ),
                          fillColor: Colors.black54,
                          labelText: "Full Name",
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'googlesansreg',
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        validator: (String value){
                          if (value.length != 2) return "Enter a valid age";
                          else return null;
                        },
                        controller: ageTEC,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'googlesansmed'
                        ),
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
                      SizedBox(height: 60.0,),
                      InkWell(
                        onTap: (){
                          userProvider.setFullName(fullNameTEC.text);
                          userProvider.setAge(ageTEC.text);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LocationFetchingScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: DARK_BLUE,
                          ),
                          height: 45.0,
                          width: 200.0,
                          child: Center(
                            child: RegularTextReg("Continue", 18.0, WHITE),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
