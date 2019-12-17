import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/base/button.dart';
import 'package:giftmoney/components/form/form_date_input.dart';
import 'package:giftmoney/components/form/form_input.dart';
import 'package:giftmoney/components/form/form_popup_menu.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/screen_util.dart';
import 'package:giftmoney/utils/validation.dart';

class AddRecordPage extends BaseStatefulPage {
  AddRecordPage({Key key}) : super(key: key);

  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends BasePageState<AddRecordPage> {
  Map<String, dynamic> _formValues = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormPopupMenu<SQLTradeType>(
                label: i18n.form_type,
                initValue: FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.inAccount, title: i18n.form_in_account),
                values: [
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.inAccount, title: i18n.form_in_account),
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.outAccount, title: i18n.form_out_account),
                ],
                onSaved: (SQLTradeType type) {
                  _formValues["type"] = type.toString().split(".").last;
                },
              )),
              SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
                label: i18n.form_amount,
                validator: Validation.amount,
                onSaved: (String text) {
                  _formValues["value"] = text;
                },
              )),
            ],
          ),
          Row(children: <Widget>[
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_event_name,
              validator: Validation.notEmpty,
              onSaved: (String text) {
                _formValues["eventName"] = text;
              },
            )),
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormDateInput(
              label: i18n.form_event_time,
              validator: Validation.date_notEmpty,
              onSaved: (DateTime date) {
                _formValues["eventTime"] = date.toString();
              },
            ))
          ]),
          Row(children: <Widget>[
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_relation,
              validator: Validation.notEmpty,
              onSaved: (String text) {
                _formValues["relationName"] = text;
              },
            )),
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_person_name,
              validator: Validation.notEmpty,
              onSaved: (String text) {
                _formValues["personName"] = text;
              },
            )),
          ]),
          Padding(padding: EdgeInsets.only(top: 20)),
          Button(
            title: i18n.bt_save,
            onPressed: () async {
              showLoading();
              saveForm().then((trade) {
                this.showHUD(i18n.hud_save_success);
              }).catchError((error) {
                this.catchError(error);
              });
            },
          ),
        ],
      )
    );
  }

  Future<SQLTrade> saveForm() async {
    if (!_formKey.currentState.validate()) {
      throw Error();
    }
    _formKey.currentState.save();
    SQLTrade trade = SQLTrade.fromJson(_formValues);
    trade = await TradeService.instance.saveTrade(trade);
    return trade;
  }
}