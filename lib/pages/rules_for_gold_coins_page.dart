import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';

class RulesForGoldCoinsPage extends BaseStatefulPage {
  @override
  _RulesForGoldCoinsPageState createState() => _RulesForGoldCoinsPageState();
}

class _RulesForGoldCoinsPageState extends BasePageState<RulesForGoldCoinsPage> {

  @override
  void initState() {
    super.initState();
    this.title = I18nUtil.shared.mine_coin_rules;
  }

  @override
  Widget buildBody(BuildContext context) {
    // var i18n = I18n.of(context);
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('如何赚取金币？', style: AppTextStyle.mainText(15)),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text('1.观看广告可以获得金币', style: AppTextStyle.secondaryText(13)),
          Text('2.分享App给好友获取金币', style: AppTextStyle.secondaryText(13)),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('金币使用规则', style: AppTextStyle.mainText(15)),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(
              '1.添加一条记录消耗${AccountService.instance.amountFor(ChargeItem.insertTrade)}个金币',
              style: AppTextStyle.secondaryText(13)),
          Text(
              '2.从Excel导入一次数据消耗${AccountService.instance.amountFor(ChargeItem.importFromExcel)}个金币',
              style: AppTextStyle.secondaryText(13)),
          Text(
              '3.导出数据至Excel消耗${AccountService.instance.amountFor(ChargeItem.exportToExcel)}个金币',
              style: AppTextStyle.secondaryText(13)),
        ])
    );
  }
}
