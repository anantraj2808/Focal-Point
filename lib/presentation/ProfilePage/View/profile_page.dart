import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/models/applied_jobs.dart';
import 'package:focal_point/presentation/AppliedJobs/View/applied_jobs_screen.dart';
import 'package:focal_point/presentation/ProfilePage/Widget/profession_box.dart';
import 'package:focal_point/services/edit_details.dart';
import 'package:focal_point/services/get_applied_jobs.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:focal_point/styles/waiting_screen.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isUserLoggedInBool = false;
  bool isEdited = false;
  bool isNameEdited = false;
  bool isAgeEdited = false;
  bool isCityEdited = false;
  bool isStateEdited = false;
  bool isGenderEdited = false;
  List professions = [];
  String gender = "";
  String numberOfAppliedJobs = "0";
  TextEditingController nameTEC = TextEditingController();
  TextEditingController phoneNoTEC = TextEditingController();
  TextEditingController cityTEC = TextEditingController();
  TextEditingController stateTEC = TextEditingController();
  TextEditingController ageTEC = TextEditingController();
  List<AppliedJob> appliedJobsList = [];

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  makeRequest() async {
    setState(() {
      loading = true;
    });
    String jwt = await SharedPrefs.getUserJWTSharedPrefs();
    await getAppliedJobs(jwt).then((val) {
      setState(() {
        appliedJobsList = val;
        numberOfAppliedJobs = appliedJobsList.length.toString();
        loading = false;
      });
    });
  }

  saveDetailsToProvider(Users userProvider){
    userProvider.setFullName(nameTEC.text);
    userProvider.setLocation(cityTEC.text,stateTEC.text);
    userProvider.setAge(ageTEC.text);
    userProvider.setProfessions(professions);
  }

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    Users userProvider = Provider.of<Users>(context);
    var width = MediaQuery.of(context).size.width;
    professions = userProvider.profession;
    nameTEC.text = userProvider.fullName;
    phoneNoTEC.text = userProvider.phoneNumber;
    cityTEC.text = userProvider.city;
    stateTEC.text = userProvider.state;
    ageTEC.text = userProvider.age;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: WHITE,
        appBar: AppBar(
          backgroundColor: WHITE,
          centerTitle: true,
          title: RegularTextReg(getTranslatedText("YourProfile",context),
              22.0,
              DARK_BLUE),
        ),
        body: Stack(
          children: [
            Opacity(opacity: loading ? 0.3 : 1.0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: width,
                margin: EdgeInsets.only(top: 30.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        !isGenderEdited ? Stack(
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
                            Positioned(
                              left: 100.0,
                              bottom: 100.0,
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: WHITE
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        //isGenderEdited = true;
                                      });
                                    },
                                    icon: Icon(Icons.edit,color: DARK_BLUE,),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        SizedBox(height: 20.0,),
                        !isNameEdited ? Container(
                            width: width,
                            child: ListTile(
                              leading: Container(
                                height: 24.0,
                                width: 24.0,
                              ),
                              title: Container(
                                alignment: Alignment.center,
                                child: RegularTextMed(userProvider.fullName,26.0,DARK_BLUE),
                              ),
                              trailing: IconButton(
                                onPressed: (){
                                  setState(() {
                                    isEdited = true;
                                    isNameEdited = true;
                                  });
                                },
                                icon: Icon(Icons.edit,size: 24.0,color: DARK_BLUE,),
                              ),
                            )
                        ) :
                        TextFormField(
                          autofocus: true,
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
                        SizedBox(height: 20.0,),
                        Container(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => AppliedJobsScreen(appliedJobsList: appliedJobsList,)
                                      ));
                                },
                                child: Container(
                                  height: 110.0,
                                  width: 110.0,
                                  child: Card(
                                    elevation: 5.0,
                                    shadowColor: GREY,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RegularTextReg("Applied", 18.0, GREY),
                                        SizedBox(height: 15.0,),
                                        RegularTextMed(numberOfAppliedJobs, 24.0, DARK_BLUE),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0,),
                              Container(
                                height: 125.0,
                                width: 125.0,
                                child: Card(
                                  elevation: 5.0,
                                  shadowColor: GREY,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RegularTextReg("In Review", 18.0, GREY),
                                      SizedBox(height: 15.0,),
                                      RegularTextMed("3", 24.0, DARK_BLUE),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 7.5,),
                        Divider(color: GREY,endIndent: 20.0,indent: 20.0,),
                        SizedBox(height: 7.5,),
                        Container(
                            width: width,
                            child: ListTile(
                              title: Container(
                                alignment: Alignment.centerLeft,
                                child: RegularTextReg("Professions : ",22.0,DARK_BLUE),
                              ),
//                                trailing: IconButton(
//                                  icon: Icon(Icons.add,size: 24.0,color: DARK_BLUE,),
//                                ),
                            )
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: PROFESSION_LIST.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        isEdited = true;
                                      });
                                      if (!professions.contains(PROFESSION_LIST[index])){
                                        setState(() {
                                          professions.add(PROFESSION_LIST[index]);
                                          print("Professions : ");
                                          print(professions.toString());
                                        });
                                      } else {
                                        setState(() {
                                          professions.remove(PROFESSION_LIST[index]);
                                          print("Professions : ");
                                          print(professions.toString());
                                        });
                                      }
                                    },
                                    child: professionBox(index,professions)
                                ),
                                SizedBox(height: 10.0,)
                              ],
                            );
                          },
                        ),
                        Divider(color: GREY,endIndent: 20.0,indent: 20.0,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: !isAgeEdited ? Row(
                            children: [
                              RegularTextReg("Age : ", 20.0, DARK_BLUE),
                              Spacer(),
                              RegularTextMed(userProvider.age, 22.0, DARK_BLUE),
                              Spacer(),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    isEdited = true;
                                    isAgeEdited = true;
                                  });
                                },
                                icon: Icon(Icons.edit,size: 24.0,color: DARK_BLUE,),
                              ),
                            ],
                          ) :
                          TextFormField(
                            autofocus: true,
                            controller: ageTEC,
                            validator: (String value){
                              if (value.isEmpty) return "Enter valid age";
                              return null;
                            },
                            onSaved: (String val){
                              userProvider.setAge(val);
                            },
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
                              labelText: "Age",
                              hintText: "Age",
                              hintStyle: TextStyle(
                                  color: GREY,
                                  fontFamily: 'googlesansreg',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Divider(color: GREY,endIndent: 20.0,indent: 20.0,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: !isCityEdited ? Row(
                            children: [
                              RegularTextReg("City : ", 20.0, DARK_BLUE),
                              Spacer(),
                              RegularTextMed(userProvider.city, 22.0, DARK_BLUE),
                              Spacer(),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    isEdited = true;
                                    isCityEdited = true;
                                  });
                                },
                                icon: Icon(Icons.edit,size: 24.0,color: DARK_BLUE,),
                              ),
                            ],
                          ) :
                          TextFormField(
                            autofocus: true,
                            controller: cityTEC,
                            validator: (String value){
                              if (value.isEmpty) return "Enter valid city";
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
                              labelText: "City",
                              hintText: "City",
                              hintStyle: TextStyle(
                                  color: GREY,
                                  fontFamily: 'googlesansreg',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Divider(color: GREY,endIndent: 20.0,indent: 20.0,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: !isStateEdited ? Row(
                            children: [
                              RegularTextReg("State : ", 20.0, DARK_BLUE),
                              Spacer(),
                              RegularTextMed(userProvider.state, 22.0, DARK_BLUE),
                              Spacer(),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    isEdited = true;
                                    isStateEdited = true;
                                  });
                                },
                                icon: Icon(Icons.edit,size: 24.0,color: DARK_BLUE,),
                              ),
                            ],
                          ) :
                          TextFormField(
                            autofocus: true,
                            controller: stateTEC,
                            validator: (String value){
                              if (value.isEmpty) return "Enter valid state";
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
                              labelText: "State",
                              hintText: "State",
                              hintStyle: TextStyle(
                                  color: GREY,
                                  fontFamily: 'googlesansreg',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(_formKey.currentState.validate() && isEdited){
                              setState(() {
                                loading = true;
                              });
                              bool returnBool;
                              saveDetailsToProvider(userProvider);
                              returnBool = await editDetails(context);
                              setState(() {
                                loading = false;
                              });
                              if(returnBool){
                                setState(() {
                                  isEdited = false;
                                  isNameEdited = false;
                                  isAgeEdited = false;
                                  isCityEdited = false;
                                  isStateEdited = false;
                                  isGenderEdited = false;
                                });
                              }
                              print("Return Bool : "+returnBool.toString());
                            }
                          },
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isEdited ? DARK_BLUE : GREY,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: RegularTextReg(getTranslatedText("SaveDetails",context), 18.0, WHITE),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),),
            loading ? waitingObject() : Container()
          ],
        )
      ),
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