import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/screens/profession_selection.dart';
import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatefulWidget {

  final user;
  LanguageSelectionScreen({this.user});

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {

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
          body: Builder(
            builder: (scaffoldContext) {
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: width,
                      child: Image(
                        image: AssetImage(LANGUAGE_BG_IMAGES[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: height,
                      width: width,
                      color: BLACK_26,
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
                                return InkWell(
                                  onTap: (){
                                    userProvider.setLanguage(LANGUAGE_LIST[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: userProvider.language == LANGUAGE_LIST[index] ? BLUE_GREY : WHITE,
                                    ),
                                    alignment: Alignment.center,
                                    height: 75.0,
                                    child: Text(LANGUAGE_LIST[index],
                                      style: TextStyle(
                                          fontSize: userProvider.language == LANGUAGE_LIST[index] ? 20.0 : 16.0,
                                          color: userProvider.language == LANGUAGE_LIST[index] ? WHITE : BLACK,
                                          fontWeight: userProvider.language == LANGUAGE_LIST[index] ? FontWeight.bold : FontWeight.normal
                                      ),),
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
                            height: 50.0,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: WHITE
                            ),
                            child: Text("Continue",style: TextStyle(fontSize: 16.0),),
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
