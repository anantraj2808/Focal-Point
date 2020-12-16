import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            color: BLUE,
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Enter your Phone No.",style: TextStyle(color: WHITE,fontSize: 24.0),),
                ),
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9]")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                      maxLength: 10,
                      maxLengthEnforced: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black54,),
                      cursorColor: Colors.black,
                      onFieldSubmitted: (String x) async {
                        //await makeRequest();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(padding: EdgeInsets.all(15.0), child: Text('+91',)),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                          borderSide: new BorderSide(),
                        ),
                        fillColor: Colors.black54,
                        labelText: "Phone Number",
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16
                        ),
                      ),
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
}
