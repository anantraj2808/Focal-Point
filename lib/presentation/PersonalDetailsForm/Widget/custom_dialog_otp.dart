import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/HomePage/View/home_screen.dart';
import 'package:focal_point/presentation/PersonalDetailsForm/View/personal_details_form.dart';
import 'package:focal_point/services/create_profile.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/services/user_authentication.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:provider/provider.dart';

import '../../home.dart';
import '../../location_fetching.dart';

class OTPDialog extends StatefulWidget {

  final String phoneNumber;

  OTPDialog(this.phoneNumber);

  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {

  TextEditingController otpTEC = TextEditingController();

  confirmOTP(BuildContext context, Users userProvider) async {
    if (otpTEC.text == "1111"){
      bool existingUser = false;
      existingUser = await getUser(context);
      await SharedPrefs.setPhoneNumberSharedPrefs(widget.phoneNumber);
      print(existingUser);
      if (existingUser) {
        await SharedPrefs.setLoggedInStatusSharedPrefs(true);
        await SharedPrefs.setUidSharedPrefs(userProvider.uid);
        await SharedPrefs.setUserJWTSharedPrefs(userProvider.userJWT);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()),
                (route) => false);
      }
      else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => PersonalDetailsForm()),
                (route) => false);
      }
    }
  }

  contentBox(BuildContext context, Users userProvider){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: WHITE,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      height: 250.0,
      child: Column(
        children: [
          RegularTextReg("An OTP has been sent to \"+91-${userProvider.phoneNumber}\". Enter the code below.", 14.0, DARK_BLUE),
          SizedBox(height: 10.0,),
          TextFormField(
            validator: (String value){
              if (value.length != 4) return "Enter valid OTP";
              return null;
            },
            controller: otpTEC,
            inputFormatters: [
              new FilteringTextInputFormatter
                  .allow(RegExp("[0-9]")),
            ],
            onChanged: (value) {
              setState(() {

              });
            },
            maxLength: 4,
            maxLengthEnforced: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
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
              labelText: "4-digit OTP",
              hintText: "4-digit OTP",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'googlesansreg',
                  fontSize: 16),
            ),
          ),
          SizedBox(height: 10.0,),
          RegularTextReg("Resend Code", 14.0, BLUE),
          SizedBox(height: 15.0,),
          GestureDetector(
            onTap: () => confirmOTP(context,userProvider),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: DARK_BLUE,
              ),
              height: 40.0,
              width: 200.0,
              child: Center(
                child: RegularTextReg("Confirm OTP", 18.0, WHITE),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context,userProvider),
    );
  }
}
