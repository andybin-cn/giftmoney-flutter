import 'package:flutter/material.dart';
import 'package:giftmoney/generated/l10n.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';

import 'base_state.dart';

abstract class BaseStatefulPage extends StatefulWidget with RatioHelper {

  BaseStatefulPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BasePageState();
}

class BasePageState<T extends BaseStatefulPage> extends BaseState<T> with RatioHelper {
  S i18n;
  String title = '';
  Color backgroundColor = Color(0xFFDFE0E1);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    i18n = S.of(context);
    return buildContainer(context);
  }

  Widget buildContainer(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(title),
        actions: appBarActions(),
      ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: this.buildSelfScrollBody(context) ?? this.buildScrollView(context),
      )
    );
  }

  List<Widget> appBarActions() {
    return null;
  }

  Widget buildScrollView(BuildContext context) {
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