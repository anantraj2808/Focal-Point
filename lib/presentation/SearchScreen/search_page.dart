import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/HomePage/Widget/jobs_list_view.dart';
import 'package:focal_point/services/search_jobs.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:focal_point/styles/waiting_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _selectedState = statesList[0];
  List<String> citiesList = [];
  String _selectedCity = "Select a city";
  bool isProfessionRegionExpanded = false;
  List<String> professionList = [];
  bool loading = false;
  int colorIndex = -1;
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

  makeRequest() async {
    setState(() {
      loading = true;
    });
    await searchJobs(professionList,_selectedCity,_selectedState,await SharedPrefs.getUserJWTSharedPrefs()).then((val){
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
      print("Plumber Job Length = " + plumberJobList.length.toString());
    });
  }

  List<Widget> professionChips(){
    List<Widget> chipList = [];
    for (int i=0 ; i<PROFESSION_LIST.length ; i++){
      chipList.add(
        GestureDetector(
          onTap: (){
            setState(() {
              String element = PROFESSION_LIST[i];
              if (professionList.contains(element)) professionList.remove(element);
              else professionList.add(element);
            });
          },
          child: Chip(
            backgroundColor: professionList.contains(PROFESSION_LIST[i]) ? DARK_BLUE : WHITE,
            avatar: CircleAvatar(
              backgroundColor: professionList.contains(PROFESSION_LIST[i]) ? DARK_BLUE : WHITE,
              child: Icon(PROFESSION_ICON_LIST[i],size: 14.0,color: professionList.contains(PROFESSION_LIST[i]) ? WHITE : DARK_BLUE,),
            ),
            label: Text(PROFESSION_LIST[i],style: TextStyle(color: professionList.contains(PROFESSION_LIST[i]) ? WHITE : DARK_BLUE,fontSize: 15.0),),
          ),
        )
      );
    }

    return chipList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: RegularTextReg(getTranslatedText("SearchForJobs",context),
            22.0,
            DARK_BLUE),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: loading ? 0.1 : 1.0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              value: _selectedState,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedState = newValue;
                                  _selectedCity = "Select a city";
                                  if(_selectedState == statesList[1]) citiesList = gujaratCities;
                                  if(_selectedState == statesList[2]) citiesList = maharashtraCities;
                                  if(_selectedState == statesList[3]) citiesList = mpCities;
                                  if(_selectedState == statesList[4]) citiesList = punjabCities;
                                  if(_selectedState == statesList[5]) citiesList = rajasthanCities;
                                  if(_selectedState == statesList[6]) citiesList = upCities;
                                  _selectedCity = citiesList[0];
                                });
                              },
                              items: statesList.map((location) {
                                return DropdownMenuItem(
                                  child: Text(location),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text('Select a city'),
                              value: _selectedCity,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCity = newValue;
                                });
                              },
                              items: citiesList.map((city) {
                                return DropdownMenuItem(
                                  child: new Text(city),
                                  value: city,
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Select Professions",style: TextStyle(fontSize: 15.0),),
                            IconButton(
                                icon: Icon(!isProfessionRegionExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,),
                                onPressed: (){
                                  setState(() {
                                    isProfessionRegionExpanded = !isProfessionRegionExpanded;
                                  });
                                })
                          ],
                        ),
                      ),
                      isProfessionRegionExpanded ? Container(
                          child: Wrap(
                            spacing: 5.0,
                            children: professionChips(),
                          )
                      ) : Container(),
                      SizedBox(height: 10.0,),
                      jobsList.isNotEmpty ? RegularTextMed("Search Results", 20.0, DARK_BLUE) : Container(),
                      SizedBox(height: 10.0,),
                      plumberJobList.isNotEmpty ? jobsListView(0,plumberJobList,++colorIndex,context) : Container(),
                      carpenterJobList.isNotEmpty ? jobsListView(1,carpenterJobList,++colorIndex,context) : Container(),
                      electricianJobList.isNotEmpty ? jobsListView(2,electricianJobList,++colorIndex,context) : Container(),
                      mechanicJobList.isNotEmpty ? jobsListView(3,mechanicJobList,++colorIndex,context) : Container(),
                      driverJobList.isNotEmpty ? jobsListView(4,driverJobList,++colorIndex,context) : Container(),
                      washermanJobList.isNotEmpty ? jobsListView(5,washermanJobList,++colorIndex,context) : Container(),
                      maidJobList.isNotEmpty ? jobsListView(6,maidJobList,++colorIndex,context) : Container(),
                      gatekeeperJobList.isNotEmpty ? jobsListView(7,gatekeeperJobList,++colorIndex,context) : Container(),
                      sweeperJobList.isNotEmpty ? jobsListView(8,sweeperJobList,++colorIndex,context) : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          loading ? waitingObject() : Container()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: Icon(Icons.search,color: WHITE,),
            backgroundColor: DARK_BLUE,
            onPressed: (){
              setState(() {
                isProfessionRegionExpanded = false;
              });
              makeRequest();
              print("SelectedCity = " + _selectedCity);
              print("SelectedState = " + _selectedState);
            }
        )
    );
  }
}