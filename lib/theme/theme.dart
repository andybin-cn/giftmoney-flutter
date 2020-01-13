
import 'package:flutter/material.dart';

class AppColor {
  static const Color mainAppColor = const Color(0xff419bd6);
  static const Color secondaryAppColor = const Color(0xffED5429);
  static const Color grayBackground = const Color(0xfff4f4f4);
  static const Color mainBlackText = const Color(0xff3e3e3e);
  static const Color secondaryText = const Color(0xff9E9E9E);
  static const Color reminderText = const Color(0xffbdbdbd);
  static const Color underlineGray = const Color(0xffcccccc);
  static const Color dividerColor = const Color(0xffbbbbbb);
  static const Color errorMsgColor = const Color(0xffE63939);

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
