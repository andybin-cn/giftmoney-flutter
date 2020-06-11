
import 'package:flutter/material.dart';

class AppColor {
  static const Color mainAppColor = const Color(0xFFEA5557);
  static const Color secondaryAppColor = const Color(0xFFF49FA1);
  static const Color grayBackground = const Color(0xFFDFE0E1);
  static const Color mainBlackText = const Color(0xff3e3e3e);
  static const Color secondaryText = const Color(0xff9E9E9E);
  static const Color reminderText = const Color(0xffbdbdbd);
  static const Color underlineGray = const Color(0xffcccccc);
  static const Color dividerColor = const Color(0xffbbbbbb);
  static const Color errorMsgColor = const Color(0xFF981C1F);

  static const Color mainGreen = const Color(0xFF4CBF45);
  static const Color secondaryGreen = const Color(0xFF4E8F4B);
  static const Color lightGreen = const Color(0xFF95DF91);
  

  static const Color goldColor = const Color(0xffFFCC00);
}

class Maudimen {
  static const double screenPaddingHorRpx = 30;//页面左右padding
  static const double formFieldVerPaddingRpx = 20;
  static const double mainTextSizeRpx = 30;
  static const double formFieldTextSizeRpx = 30;
}

class AppTextStyle {
  static TextStyle mainText(double fontSize) {
    return TextStyle(fontSize: fontSize, color: AppColor.mainBlackText);
  }
  static TextStyle secondaryText(double fontSize) {
    return TextStyle(fontSize: fontSize, color: AppColor.secondaryText);
  }
  static TextStyle reminderText(double fontSize) {
    return TextStyle(fontSize: fontSize, color: AppColor.reminderText);
  }
}
