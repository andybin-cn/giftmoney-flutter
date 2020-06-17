import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/generated/l10n.dart';
import 'base_state.dart';

abstract class BasePageState<T extends StatefulWidget> extends BaseState<T> with AutomaticKeepAliveClientMixin {
  String title = '';
  bool hasAppbar = true;
  Color titleColor = Colors.black;
  Color backgroundColor = Colors.white;
  Color appBarBackgroundColor = Colors.white;
  Color appBarIconColor = Colors.black;
  S i18n;
  List<Widget> actions = [];

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint('${this.toString()} build call');
    i18n = S.of(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: this.buildAppBar(context),
        body: this.buildSelfScrollBody(context) ?? SingleChildScrollView(child: this.buildBody(context)),
      ),
    );
  }

  Future<bool> onWillPop() {
    return Future.value(true);
  }

  Widget buildAppBar(BuildContext context) {
    if (hasAppbar) {
      return PreferredSize(
        preferredSize: Size.fromHeight(rpx(88)),
        child: AppBar(
          iconTheme: IconThemeData(color: appBarIconColor),
          centerTitle: true,
          title: Text(this.title, style: TextStyle(color: titleColor)),
          backgroundColor: appBarBackgroundColor,
          actions: this.actions,
        ),
      );
    } else {
      return null;
    }
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
