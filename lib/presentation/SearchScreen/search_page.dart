import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/constants/strings.dart';
import 'package:focal_point/styles/get_translated_text.dart';
import 'package:focal_point/styles/text_styles.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _selectedState = statesList[0];
  List<String> citiesList = [];
  String _selectedCity = "Select a city";

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
      body: SafeArea(
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
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: Icon(Icons.search,color: WHITE,),
            backgroundColor: DARK_BLUE,
            onPressed: (){
              print("SelectedCity = " + _selectedCity);
              print("SelectedState = " + _selectedState);
            }
        )
    );
  }
}