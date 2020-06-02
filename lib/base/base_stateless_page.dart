import 'package:flutter/material.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';

abstract class BaseStatelessPage extends StatelessWidget with RatioHelper {
  final bool hasAppbar;
  final String title;
  BaseStatelessPage({Key key, this.hasAppbar = true, this.title = ''}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.buildAppBar(context),
      body: this.buildSelfScrollBody(context) ?? _buildScrollView(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    if(hasAppbar) {
      return PreferredSize(
        preferredSize: Size.fromHeight(rpx(88)),
        child: AppBar(
          centerTitle: true,
          title: Text(this.title),
        ),
      );
    } else {
      return null;
    }
  }

  Widget _buildScrollView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(child: buildBody(context), physics: AlwaysScrollableScrollPhysics()),
        )
      ]
    );
  }

  //不需要添加滚动的界面
  Widget buildSelfScrollBody(BuildContext context) {
    return null;
  }

  //需要添加滚动的界面
  Widget buildBody(BuildContext context) {
    return null;
  }

}