import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:focal_point/models/Users.dart';
import 'package:gscarousel/gscarousel.dart';
import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatefulWidget {

  final user;
  LanguageSelectionScreen(this.user);

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {

  List<String> imagesList = ["assets/images/language1.jpg","assets/images/language2.jpg"];
  List<String> languagesList = ["English","हिन्दी","मराठी"];
  Users user;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Users userTemp = Provider.of<Users>(context);
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
                        image: AssetImage(imagesList[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: height,
                      width: width,
                      color: Colors.black26,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            height: 300.0,
                            width: 250.0,
                            child: ListView.builder(
                              itemCount: languagesList.length,
                              itemBuilder: (context,index){
                                return InkWell(
                                  onTap: (){
                                    userTemp.setLanguage(languagesList[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: userTemp.language == languagesList[index] ? Colors.blueGrey : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    height: 75.0,
                                    child: Text(languagesList[index],
                                      style: TextStyle(
                                          fontSize: userTemp.language == languagesList[index] ? 20.0 : 16.0,
                                          color: userTemp.language == languagesList[index] ? Colors.white : Colors.black,
                                          fontWeight: userTemp.language == languagesList[index] ? FontWeight.bold : FontWeight.normal
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
                            if (userTemp.language.isNotEmpty){
                              user = widget.user;
                              user.setLanguage(userTemp.language);
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
                              color: Colors.white
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
