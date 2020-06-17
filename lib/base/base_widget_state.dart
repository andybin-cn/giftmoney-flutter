import 'package:flutter/material.dart';
import 'package:giftmoney/generated/l10n.dart';

import 'base_state.dart';

abstract class BaseWidgetState<T extends StatefulWidget> extends BaseState<T> {
  S i18n;

  @override
  Widget build(BuildContext context) {
    i18n = S.of(context);
    return this.buildBody(context);
  }

  //使用的时候继承buildBody方法
  Widget buildBody(BuildContext context) {
    return null;
  }

}
