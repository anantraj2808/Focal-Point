import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/HomePage/Widget/banner_carousel.dart';
import 'package:focal_point/presentation/HomePage/Widget/jobs_list_view.dart';
import 'package:focal_point/presentation/ThankYouPage/View/thank_you_page.dart';
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
  List<Job> plumberJobList = [];
  List<Job> carpenterJobList = [];
  List<Job> electricianJobList = [];
  List<Job> mechanicJobList = [];
  List<Job> driverJobList = [];
  List<Job> washermanJobList = [];
  List<Job> maidJobList = [];
  List<Job> gatekeeperJobList = [];
  List<Job> sweeperJobList = [];
  bool isLoading = false;

  Job plumberJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 700" ,payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Plumber",dutyType: "Full-time",numberOfOpenings: "2",minimumQualification: "No education qualifications required",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly",jobId: "6000743a238a50226c89c5b3");
  Job electricianJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 800",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Electrician",dutyType: "Full-time",numberOfOpenings: "1",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");
  Job driverJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 500",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Driver",dutyType: "Full-time",numberOfOpenings: "3",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");
  Job carpenterJob = Job(companyName: "XYZ Pvt. Ltd.",salary: "₹ 900",payBasis: "per Day",city: "Bareilly",state: "UP",professionType: "Carpenter",dutyType: "Full-time",numberOfOpenings: "1",minimumQualification: "B.Tech preferred",languageRequired: "English or Hindi",description: LOREM_IPSUM,experienceRequired: "Minimum 2 years of experience",workTimings: "9AM - 4PM",completeAddress: "14, Model Town, Near City Heart, Bareilly");


  @override
  void initState() {
    isLoading = true;
    super.initState();
    //getProfessionsList();
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    plumberJobList.add(plumberJob);
    electricianJobList.add(electricianJob);
    electricianJobList.add(electricianJob);
    electricianJobList.add(electricianJob);
    electricianJobList.add(electricianJob);
    driverJobList.add(driverJob);
    driverJobList.add(driverJob);
    carpenterJobList.add(carpenterJob);
    carpenterJobList.add(carpenterJob);
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

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: RegularTextReg(getTranslatedText("YourOpportunities",context), 22.0, BLACK),
      ),
      body: SafeArea(
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
//                GestureDetector(
//                  onTap: (){
//                    Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => waitingObject(),
//                    ));
//                  },
//                  child: Container(
//                    height: 50.0,
//                    width: width,
//                    margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
//                    decoration: BoxDecoration(
//                      color: DARK_BLUE,
//                      borderRadius: BorderRadius.circular(10.0)
//                    ),
//                    child: Container(
//                      alignment: Alignment.center,
//                      child: RegularTextReg(
//                        "Applied Jobs",
//                          //getTranslatedText("AppliedJobs",context),
//                          20.0,WHITE)),
//                  ),
//                ),
                userProvider.profession.contains("Plumber") && plumberJobList.isNotEmpty ? jobsListView(0,plumberJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Carpenter") && carpenterJobList.isNotEmpty ? jobsListView(1,carpenterJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Electrician") && electricianJobList.isNotEmpty ? jobsListView(2,electricianJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Motor Mechanic") && mechanicJobList.isNotEmpty ? jobsListView(3,mechanicJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Driver") && driverJobList.isNotEmpty ? jobsListView(4,driverJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Washer Man") && washermanJobList.isNotEmpty ? jobsListView(5,washermanJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Home Maid") && maidJobList.isNotEmpty ? jobsListView(6,maidJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Gatekeeper") && gatekeeperJobList.isNotEmpty ? jobsListView(7,gatekeeperJobList,++colorIndex,context) : Container(),
                userProvider.profession.contains("Sweeper") && sweeperJobList.isNotEmpty ? jobsListView(8,sweeperJobList,++colorIndex,context) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}