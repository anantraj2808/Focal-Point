import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/HomePage/Widget/jobs_list_view.dart';
import 'package:focal_point/services/shared_prefs_ready_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SharedPrefsReadyState sharedPrefsReadyState = SharedPrefsReadyState();
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

  Job plumberJob = Job(companyName: "Anant Raj Pvt. Ltd.",salary: "₹ 700/day",city: "Bareilly",state: "UP",professionType: "Plumber",dutyType: "Full-time");
  Job electricianJob = Job(companyName: "Anant Raj Pvt. Ltd.",salary: "₹ 800/day",city: "Bareilly",state: "UP",professionType: "Electrician",dutyType: "Full-time");
  Job driverJob = Job(companyName: "Anant Raj Pvt. Ltd.",salary: "₹ 500/day",city: "Bareilly",state: "UP",professionType: "Driver",dutyType: "Full-time");
  Job carpenterJob = Job(companyName: "Anant Raj Pvt. Ltd.",salary: "₹ 900/day",city: "Bareilly",state: "UP",professionType: "Carpenter",dutyType: "Full-time");


  @override
  void initState() {
    super.initState();
    getProfessionsList();
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

  getProfessionsList(){
    setState(() {
      professionsList = sharedPrefsReadyState.professionsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: Text("Your Opportunities",style: TextStyle(color: BLACK),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: WHITE,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                professionsList.contains("Plumber") && plumberJobList.isNotEmpty ? jobsListView("Plumber",plumberJobList,context) : Container(),
                professionsList.contains("Carpenter") && carpenterJobList.isNotEmpty ? jobsListView("Carpenter",carpenterJobList,context) : Container(),
                professionsList.contains("Electrician") && electricianJobList.isNotEmpty ? jobsListView("Electrician",electricianJobList,context) : Container(),
                professionsList.contains("Motor Mechanic") && mechanicJobList.isNotEmpty ? jobsListView("Motor Mechanic",mechanicJobList,context) : Container(),
                professionsList.contains("Driver") && driverJobList.isNotEmpty ? jobsListView("Driver",driverJobList,context) : Container(),
                professionsList.contains("Washerman") && washermanJobList.isNotEmpty ? jobsListView("Washerman",washermanJobList,context) : Container(),
                professionsList.contains("Home Maid") && maidJobList.isNotEmpty ? jobsListView("Home Maid",maidJobList,context) : Container(),
                professionsList.contains("Gatekeeper") && gatekeeperJobList.isNotEmpty ? jobsListView("Gatekeeper",gatekeeperJobList,context) : Container(),
                professionsList.contains("Sweeper") && sweeperJobList.isNotEmpty ? jobsListView("Sweeper",sweeperJobList,context) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
