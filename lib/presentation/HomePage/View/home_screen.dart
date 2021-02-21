import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/HomePage/Widget/banner_carousel.dart';
import 'package:focal_point/presentation/HomePage/Widget/jobs_list_view.dart';
import 'package:focal_point/presentation/ThankYouPage/View/thank_you_page.dart';
import 'package:focal_point/services/get_home_screen_jobs.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/services/user_authentication.dart';
import 'package:focal_point/styles/waiting_screen.dart';
import 'package:translator/translator.dart';
import 'package:focal_point/services/shared_prefs_ready_state.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:focal_point/models/Users.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int colorIndex = -1;

  SharedPrefsReadyState _sharedPrefsReadyState = SharedPrefsReadyState();
  List<String> professionsList = [];
  List<Job> jobsList = [];
  List<Job> plumberJobList = [];
  List<Job> carpenterJobList = [];
  List<Job> electricianJobList = [];
  List<Job> mechanicJobList = [];
  List<Job> driverJobList = [];
  List<Job> washermanJobList = [];
  List<Job> maidJobList = [];
  List<Job> gatekeeperJobList = [];
  List<Job> sweeperJobList = [];
  bool loading = false;

  Job plumberJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 700" ,payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Plumber",dutyType: "Full-time",numberOfOpenings: "2",minimumQualification: "No education qualifications required",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly",jobId: "6000743a238a50226c89c5b3");
  Job electricianJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 800",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Electrician",dutyType: "Full-time",numberOfOpenings: "1",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");
  Job driverJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 500",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Driver",dutyType: "Full-time",numberOfOpenings: "3",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");
  Job carpenterJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 900",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Carpenter",dutyType: "Full-time",numberOfOpenings: "1",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");


  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  makeRequest() async {
    setState(() {
      loading = true;
    });
    bool isUserDetailSet = await setUserDetails(context, await SharedPrefs.getUserJWTSharedPrefs());
    if (isUserDetailSet){
      await getHomeScreenJobs(context, await SharedPrefs.getUserJWTSharedPrefs()).then((val){
        setState(() {
          jobsList = val;
          for (int i=0 ; i<jobsList.length ; i++){
            if (jobsList[i].professionType == "Plumber") plumberJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Carpenter") carpenterJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Electrician") electricianJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Mechanic") mechanicJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Driver") driverJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Washerman") washermanJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Homemaid") maidJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Gatekeeper") gatekeeperJobList.add(jobsList[i]);
            if (jobsList[i].professionType == "Sweeper") sweeperJobList.add(jobsList[i]);
          }
          loading = false;
        });
      });
    }
  }

  convertText(String text) async {
    String convertedText = "text";
    final translator = GoogleTranslator();
    await translator.translate(text,to: 'it').then((value){
      convertedText = value.toString();
      print("Translated text : "+convertedText);
    });
    return convertedText;
  }

  checkForEmptyScreen(List<String> list){
    if(list.contains("Plumber") && plumberJobList.isNotEmpty) return false;
    if(list.contains("Carpenter") && carpenterJobList.isNotEmpty) return false;
    if(list.contains("Electrician") && electricianJobList.isNotEmpty) return false;
    if(list.contains("Mechanic") && mechanicJobList.isNotEmpty) return false;
    if(list.contains("Driver") && driverJobList.isNotEmpty) return false;
    if(list.contains("Washerman") && washermanJobList.isNotEmpty) return false;
    if(list.contains("Homemaid") && maidJobList.isNotEmpty) return false;
    if(list.contains("Gatekeeper") && gatekeeperJobList.isNotEmpty) return false;
    if(list.contains("Sweeper") && sweeperJobList.isNotEmpty) return false;
    return true;
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
        title: RegularTextReg(getTranslatedText("YourOpportunities",context), 22.0, BLACK),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: loading ? 0.1 : 1.0,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: WHITE,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5.0,right: 5.0, top: 10.0,bottom: 15.0),
                        height: height/6,
                        color: WHITE,
                        child: carouselContainer(),
                      ),
                      checkForEmptyScreen(userProvider.profession) ? Container(
                        child: Center(
                          child: !loading ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50.0),
                                  height: 200.0,
                                  width: 200.0,
                                  child: Image.asset("assets/images/no_job_found.png")),
                              RegularTextRegCenter("No suitable job found", 24, DARK_BLUE)
                            ],
                          ) : Container(),
                        ),
                      ) : Container(),
                      userProvider.profession.contains("Plumber") && plumberJobList.isNotEmpty ? jobsListView(0,plumberJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Carpenter") && carpenterJobList.isNotEmpty ? jobsListView(1,carpenterJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Electrician") && electricianJobList.isNotEmpty ? jobsListView(2,electricianJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Mechanic") && mechanicJobList.isNotEmpty ? jobsListView(3,mechanicJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Driver") && driverJobList.isNotEmpty ? jobsListView(4,driverJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Washerman") && washermanJobList.isNotEmpty ? jobsListView(5,washermanJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Homemaid") && maidJobList.isNotEmpty ? jobsListView(6,maidJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Gatekeeper") && gatekeeperJobList.isNotEmpty ? jobsListView(7,gatekeeperJobList,++colorIndex,context) : Container(),
                      userProvider.profession.contains("Sweeper") && sweeperJobList.isNotEmpty ? jobsListView(8,sweeperJobList,++colorIndex,context) : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          loading ? waitingObject() : Container()
        ],
      )
    );
  }
}