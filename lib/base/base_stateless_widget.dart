import 'package:flutter/material.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';

abstract class BaseStatelessWidget extends StatelessWidget with RatioHelper {

  @override
  Widget build(BuildContext context) {
    return this.buildBody(context);
  }

  //使用的时候继承buildBody方法
  Widget buildBody(BuildContext context) {
    return null;
  }

}