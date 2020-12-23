import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/presentation/PersonalDetailsForm/Widget/custom_dialog_otp.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:focal_point/models/Users.dart';
import 'package:provider/provider.dart';

class PersonalDetailsForm extends StatefulWidget {
  @override
  _PersonalDetailsFormState createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberTEC = TextEditingController();
  TextEditingController fullNameTEC = TextEditingController();
  bool checkedStatus = false;
  bool buttonClicked = false;
  String termsAndConditionsText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    super.initState();
    buttonClicked = false;
  }

  sendOTP(BuildContext context){
    //TODO
    showDialog(context: context,
        builder: (BuildContext context){
          return OTPDialog();
        }
    );
  }

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
                      TextFormField(
                        validator: (String value){
                          if (value.length <= 2) return "Enter valid name";
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
                      SizedBox(height: 30.0,),
                      TextFormField(
                        validator: (String value){
                          if (value.length != 10) return "Enter valid phone number";
                          return null;
                        },
                        controller: phoneNumberTEC,
                        inputFormatters: [
                          new FilteringTextInputFormatter
                              .allow(RegExp("[0-9]")),
                        ],
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                        maxLength: 10,
                        maxLengthEnforced: true,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'googlesansmed'),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: RegularTextReg("+91", 18.0, BLACK)
                          ),
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
                      SizedBox(height: 15.0,),
                      RegularTextReg("An OTP will be sent to the given Contact Number.", 16.0, DARK_BLUE),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Checkbox(
                            value: checkedStatus,
                            onChanged: (newValue){
                              setState(() {
                                checkedStatus = newValue;
                              });
                            },
                          ),
                          RegularTextReg("I agree to given ", 16.0, DARK_BLUE),
                          GestureDetector(
                            onTap: (){
                              showDialog<void>(
                                context: context,
                                // false = user must tap button, true = tap outside dialog
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: RegularTextReg("Terms & Conditions", 16.0, DARK_BLUE),
                                    content: Text(termsAndConditionsText),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: RegularTextReg("OK", 16.0, DARK_BLUE),
                                        onPressed: () {
                                          Navigator.of(dialogContext)
                                              .pop(); // Dismiss alert dialog
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: RegularTextReg("terms & conditions", 16.0, BLUE)),
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      InkWell(
                        onTap: (){
                          if (!checkedStatus){
                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Agree to given terms and conditions"),
                                  action: SnackBarAction(
                                  onPressed: (){},
                                  label: "OK",
                              ),
                            ));
                          }
                          if(_formKey.currentState.validate() && checkedStatus){
                            setState(() {
                              buttonClicked = true;
                            });
                            userProvider.setFullName(fullNameTEC.text);
                            userProvider.setPhoneNumber(phoneNumberTEC.text);
                            sendOTP(context);
                            setState(() {
                              buttonClicked = false;
                            });
                          }
                        },
                        child: !buttonClicked ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: DARK_BLUE,
                          ),
                          height: 45.0,
                          width: 200.0,
                          child: Center(
                            child: RegularTextReg("Send OTP", 18.0, WHITE),
                          ),
                        ) : CircularProgressIndicator(backgroundColor: WHITE),
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
