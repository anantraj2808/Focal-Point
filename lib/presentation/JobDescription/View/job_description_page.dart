import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/models/job.dart';
import 'package:focal_point/presentation/JobDescription/Widget/description_items.dart';
import 'package:focal_point/presentation/JobDescription/Widget/openings_box.dart';
import 'package:focal_point/presentation/PersonalDetailsForm/View/personal_details_form.dart';
import 'package:focal_point/presentation/ThankYouPage/View/thank_you_page.dart';
import 'package:focal_point/services/apply_to_jobs.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:focal_point/styles/text_styles.dart';
import 'package:focal_point/styles/waiting_screen.dart';
import 'package:provider/provider.dart';

class JobDescription extends StatefulWidget {
  final Job job;
  JobDescription({this.job});
  @override
  _JobDescriptionState createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {

  Job job;
  int professionIndex = 0;
  bool loading = false;

  @override
  void initState() {
    job = widget.job;
    professionIndex = PROFESSION_LIST.indexOf(job.professionType,0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: WHITE,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RegularTextReg("Job Search for ",20,DARK_BLUE),
              RegularTextReg(job.professionType[0]=="A" || job.professionType[0]=="E" || job.professionType[0]=="I" || job.professionType[0]=="O" || job.professionType[0]=="u" ? "an " : "a ", 20.0, DARK_BLUE),
              RegularTextMed(job.professionType, 20.0, DARK_BLUE)
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(opacity: loading ? 0.3 : 1.0,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height-157.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 170.0,
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(PROFESSION_ICON_LIST[professionIndex],size: 75.0,color: DARK_BLUE,),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: openingsBox(job.numberOfOpenings),
                              )
                            ],
                          ),
                        ),
                        Divider(color: GREY,indent: 20.0,endIndent: 20.0,),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: RegularTextMed(job.professionType, 20.0, DARK_BLUE)),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,color: DARK_BLUE,),
                                      RegularTextReg(job.city + ", " + job.state, 16.0, DARK_BLUE)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Container(
                                    margin: EdgeInsets.only(left: 1.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.timer,color: DARK_BLUE,size: 20.0,),
                                        RegularTextReg(" "+job.dutyType, 16.0, DARK_BLUE)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.centerLeft,
                                      child: RegularTextMed(job.salary, 20.0, DARK_BLUE)
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.centerLeft,
                                      child: RegularTextMed(job.payBasis, 14.0, DARK_BLUE)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: GREY,indent: 20.0,endIndent: 20.0,),
                        descriptionItems("Description",job.description,0),
                        descriptionItems("Minimum Education",job.minimumQualification,1),
                        descriptionItems("Experience Required",job.experienceRequired,2),
                        descriptionItems("Language to be known",job.languageRequired,3),
                        descriptionItems("Work Timings",job.workTimings,4),
                        descriptionItems("Complete Address",job.completeAddress,5),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: WHITE,
                    border: Border(top: BorderSide(color: DARK_BLUE, width: 2.0)),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        bool isApplicationSuccessful = false;
                        isApplicationSuccessful = await applyToJob(job.jobId, await SharedPrefs.getUserJWTSharedPrefs());
                        setState(() {
                          loading = false;
                        });
                        if (isApplicationSuccessful){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThankYouPage()
                              )
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: DARK_BLUE,
                        ),
                        height: 45.0,
                        width: 200.0,
                        child: Center(
                          child: RegularTextReg("Apply for this Job", 18.0, WHITE),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),),
          loading ? waitingObject() : Container()
        ],
      )
    );
  }
}
