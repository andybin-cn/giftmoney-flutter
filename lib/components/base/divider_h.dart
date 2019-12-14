import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_widget.dart';

class DividerH extends BaseStatelessWidget {
  final Color color;
  final double height;
  DividerH({this.color, this.height});

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? rpx(1),
      color: color ?? Colors.black12,
    );
  }
}