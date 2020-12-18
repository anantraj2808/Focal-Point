import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/icons/custom_icons.dart';
import 'package:focal_point/models/Users.dart';
import 'package:focal_point/presentation/ProfessionSelection/Widget/profession_tile.dart';
import 'package:focal_point/presentation/home.dart';
import 'package:focal_point/services/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionSelectionScreen extends StatefulWidget {
  @override
  _ProfessionSelectionScreenState createState() =>
      _ProfessionSelectionScreenState();
}

class _ProfessionSelectionScreenState extends State<ProfessionSelectionScreen> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    Users userProvider = Provider.of<Users>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select at most 5",style: TextStyle(color: BLACK),),
        backgroundColor: WHITE,
      ),
      body: Builder(
        builder: (scaffoldContext) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: height-235.0,
                          width: width-30,
                          child: GridView.count(
                            crossAxisCount: 2,
                          children: List.generate(PROFESSION_LIST.length, (index){
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 7.5),
                              child: Card(
                                color: userProvider.profession.contains(PROFESSION_LIST[index]) ? BLUE_GREY : WHITE,
                                elevation: 5.0,
                                shadowColor: GREY,
                                child: InkWell(
                                    onTap: () {
                                      if (selectedItems.contains(PROFESSION_LIST[index])) {
                                        selectedItems.remove(PROFESSION_LIST[index]);
                                        userProvider.removeProfession(PROFESSION_LIST[index]);
                                      } else {
                                        if (selectedItems.length<=4){
                                          selectedItems.add(PROFESSION_LIST[index]);
                                          userProvider.addProfession(PROFESSION_LIST[index]);}
                                        else{
                                          Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
                                            content: Text("Maximum limit is 5"),
                                            action: SnackBarAction(
                                              label: "OK",
                                              onPressed: (){},
                                            ),
                                          ));
                                        }
                                      }
                                    },
                                    child: ProfessionTile(profession: PROFESSION_LIST[index],icon: Icon(PROFESSION_ICON_LIST[index],size: 40.0,color: userProvider.profession.contains(PROFESSION_LIST[index]) ? WHITE : BLACK,),userProvider: userProvider,)
                                ),
                              ),
                            );
                          }),)),
                      SizedBox(height: 20.0,),
                      InkWell(
                        onTap: (){
                          if (selectedItems.isNotEmpty){
                            SharedPrefs.setLoggedInStatusSharedPrefs(true);
                            SharedPrefs.setCitySharedPrefs(userProvider.city);
                            SharedPrefs.setStateSharedPrefs(userProvider.state);
                            SharedPrefs.setLanguageSharedPrefs(userProvider.language);
                            SharedPrefs.setProfessionsSharedPrefs(userProvider.profession);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                          }
                          else {
                            Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
                              content: Text("Select a profession!"),
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
                              color: userProvider.profession.isEmpty ? Colors.black12 : BLUE_GREY
                          ),
                          child: Text("Continue",style: TextStyle(fontSize: 16.0,
                          color: userProvider.profession.isEmpty ? BLACK : WHITE),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}