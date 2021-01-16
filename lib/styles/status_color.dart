import 'package:focal_point/constants/colors.dart';

getStatusColor(String status){
  if (status == 'accepted') return GREEN;
  else if (status == 'in process') return YELLOW;
  else if (status == 'rejected') return DARK_GREY;
  else if (status == 'applied') return DARK_BLUE;
  else return DARK_BLUE;
}