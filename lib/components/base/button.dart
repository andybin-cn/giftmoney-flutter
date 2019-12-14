import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_widget.dart';
import 'package:giftmoney/theme/theme.dart';

class Button extends BaseStatelessWidget {
  final String title;
  final Color fillColor;
  final Color titleColor;
  final double padding;
  final Function onPressed;
  Button({this.title, this.titleColor, this.fillColor, this.padding, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? rpx(30)),
      child: RawMaterialButton(
        //注意如果fillColor为null，就不会有阴影展示
        fillColor: fillColor ?? AppColor.mainAppColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.white.withOpacity(0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rpx(12))),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: rpx(90),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: titleColor ?? Colors.white, fontSize: rpx(32)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
