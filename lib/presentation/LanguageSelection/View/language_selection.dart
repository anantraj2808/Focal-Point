import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/LanguageSelection/Widget/language_card.dart';
import 'package:provider/provider.dart';

import '../../ProfessionSelection/View/profession_selection.dart';

class LanguageSelectionScreen extends StatefulWidget {

  final user;
  LanguageSelectionScreen({this.user});

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {

  String city = "";
  String state = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Users userProvider = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        centerTitle: true,
        title: Text("Select Language",style: TextStyle(color: BLACK),),
      ),
          body: Builder(
            builder: (scaffoldContext) {
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      color: WHITE,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            height: 300.0,
                            width: 250.0,
                            child: ListView.builder(
                              itemCount: LANGUAGE_LIST.length,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  child: InkWell(
                                    onTap: (){
                                      userProvider.setLanguage(LANGUAGE_LIST[index]);
                                    },
                                    child: languageCard(userProvider,index)
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 100.0,),
                        InkWell(
                          onTap: (){
                            if (userProvider.language.isNotEmpty){
                              userProvider.setLocation(widget.user.city, widget.user.state);
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProfessionSelectionScreen()
                              ));
                            }
                            else {
                              Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
                                content: Text("Select a language!"),
                                action: SnackBarAction(
                                  label: "OK",
                                  onPressed: (){},
                                ),
                              ));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: userProvider.language.isEmpty ? Colors.black12 : BLUE_GREY,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 50.0,
                            child: Text("Continue",style: TextStyle(fontSize: 16.0,color: userProvider.language.isEmpty ? BLACK : WHITE),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          ),
        );
  }
}
