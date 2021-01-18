import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
  RangeLabels labels = RangeLabels('0', "20000");
  RangeValues values = RangeValues(0, 20000);

  @override
  void initState() {
    super.initState();
    buttonClicked = false;
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
              margin: EdgeInsets.only(top: 20.0),
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
                      SizedBox(height: 20.0,),
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
                      SizedBox(height: 15.0,),
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
                      SizedBox(height: 10.0,),
                      Divider(color: DARK_BLUE,indent: 5.0,endIndent: 5.0,),
                      SizedBox(height: 10.0,),
                      RegularTextRegCenter("Preferred Salary Range (Per month)", 20.0, DARK_BLUE),
                      RegularTextMedCenter("पसंदीदा वेतन सीमा (प्रति माह)", 20.0, DARK_BLUE),
                      SizedBox(height: 10.0,),
                      RangeSlider(
                          divisions: 4,
                          activeColor: DARK_BLUE,
                          inactiveColor: GREY,
                          min: 0,
                          max: 20000,
                          values: values,
                          labels: labels,
                          onChanged: (value){
                            print("START: ${value.start}, End: ${value.end}");
                            setState(() {
                              values = value;
                              labels = RangeLabels("₹ ${value.start.toInt().toString()}", "₹ ${value.end.toInt().toString()}");
                            });
                          }
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: DARK_BLUE),
                              color: WHITE,
                            ),
                            height: 40.0,
                            width: 100.0,
                            child: Container(alignment: Alignment.center,child: RegularTextReg("₹ ${values.start.toInt().toString()}", 18.0, DARK_BLUE,)),
                          ),
                          SizedBox(width: 7,),
                          RegularTextReg("\-", 20.0, DARK_BLUE),
                          SizedBox(width: 7,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: DARK_BLUE),
                              color: WHITE,
                            ),
                            height: 40.0,
                            width: 100.0,
                            child: Container(alignment: Alignment.center,child: RegularTextReg("₹ ${values.end.toInt().toString()}", 18.0, DARK_BLUE,)),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.0,),
                      InkWell(
                        onTap: (){
                          userProvider.setFullName(fullNameTEC.text);
                          userProvider.setAge(ageTEC.text);
                          userProvider.setSalaryRange("${values.start.toInt().toString()}-${values.end.toInt().toString()}");
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
