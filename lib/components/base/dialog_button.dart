import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_widget.dart';
import 'package:giftmoney/theme/theme.dart';

//放在dialog底部的透明button，不需要阴影
class DialogButton extends BaseStatelessWidget {
  final String title;
  final Color titleColor;
  final ShapeBorder shape;
  final bool borderLeft;
  final Function onPressed;
  DialogButton({this.title, this.titleColor, this.shape, this.borderLeft = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //设置fillColor为null，就不会有阴影展示
      fillColor: null,
      splashColor: Colors.transparent,
      highlightColor: AppColor.grayBackground,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(rpx(8)))),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: rpx(90),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black12, width: rpx(1)),
            left: borderLeft ? BorderSide(color: Colors.black12, width: rpx(1)) : BorderSide.none,
          ),
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
              color: titleColor ?? AppColor.mainAppColor,
              fontSize: rpx(32),
            ),
          ),
        ),
      ),
    );
  }
}
