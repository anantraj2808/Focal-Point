import 'package:flutter/cupertino.dart';
import 'package:focal_point/constants/colors.dart';
import 'package:focal_point/models/Users.dart';

class ProfessionTile extends StatelessWidget {

  final String profession;
  final Icon icon;
  final Users userProvider;
  ProfessionTile({this.profession,this.icon,this.userProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 15.0),
          Text(
            profession,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: userProvider.profession.contains(profession) ? WHITE : BLACK,
                fontSize: userProvider.profession.contains(profession) ? 18.0 : 16.0,
                fontWeight: userProvider.profession.contains(profession) ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }
}
