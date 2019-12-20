import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/base/button.dart';
import 'package:giftmoney/components/form/form_date_input.dart';
import 'package:giftmoney/components/form/form_input.dart';
import 'package:giftmoney/components/form/form_popup_menu.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/CommonError.dart';
import 'package:giftmoney/utils/screen_util.dart';
import 'package:giftmoney/utils/validation.dart';

class AddRecordPage extends BaseStatefulPage {
  final SQLTrade trade;
  AddRecordPage({Key key, this.trade}) : super(key: key);

  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends BasePageState<AddRecordPage> {
  Map<String, dynamic> _formValues = {};
  final _formKey = GlobalKey<FormState>();
  SQLTrade trade;

  @override
  void initState() { 
    super.initState();
    trade = widget.trade;
  }

  @override
  Widget buildBody(BuildContext context) {
    SQLTradeType initTradeType = trade?.type ?? SQLTradeType.inAccount;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormPopupMenu<SQLTradeType>(
                label: i18n.form_type,
                validator: Validation.relation,
                initValue: FormPopupMenuValue<SQLTradeType>(value: initTradeType, title: initTradeType == SQLTradeType.inAccount ? i18n.form_in_account : i18n.form_out_account),
                values: [
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.inAccount, title: i18n.form_in_account),
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.outAccount, title: i18n.form_out_account),
                ],
                onSaved: (SQLTradeType type) {
                  _formValues["type"] = type.toString().split(".").last;
                },
              )),
              SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
                initialValue: widget.trade?.value?.toString(),
                label: i18n.form_amount,
                validator: Validation.amount,
                keyboardType: TextInputType.number,
                onSaved: (String text) {
                  _formValues["value"] = num.parse(text);
                },
              )),
            ],
          ),
          Row(children: <Widget>[
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_event_name,
              initialValue: widget.trade?.eventName,
              validator: Validation.eventName,
              onSaved: (String text) {
                _formValues["eventName"] = text;
              },
            )),
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormDateInput(
              label: i18n.form_event_time,
              initialValue: widget.trade?.eventTime,
              validator: Validation.date_notEmpty,
              onSaved: (DateTime date) {
                _formValues["eventTime"] = date.toString();
              },
            ))
          ]),
          Row(children: <Widget>[
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_relation,
              initialValue: widget.trade?.relationName,
              validator: Validation.relation,
              onSaved: (String text) {
                _formValues["relationName"] = text;
              },
            )),
            SizedBox(width: ScreenUtil.screenWidthDp/2, child: FormInput(
              label: i18n.form_person_name,
              initialValue: widget.trade?.personName,
              validator: Validation.userName,
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
      throw CommonError(i18n.form_error);
    }
    _formKey.currentState.save();
    SQLTrade trade = SQLTrade.fromJSON(_formValues);
    if(widget.trade?.id != null) {
      trade.id = widget.trade?.id;
    }
    trade = await TradeService.instance.saveTrade(trade);
    return trade;
  }
}