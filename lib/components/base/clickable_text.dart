import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_widget.dart';
import 'package:giftmoney/theme/theme.dart';

class ClickableText extends BaseStatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final Function onTap;
  ClickableText({this.title, this.color, this.fontSize, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: rpx(20)),
        child: Text(
          title,
          style: TextStyle(
            color: color ?? AppColor.mainAppColor,
            fontSize: fontSize ?? rpx(32),
          ),
        ),
      ),
    );
  }
}
