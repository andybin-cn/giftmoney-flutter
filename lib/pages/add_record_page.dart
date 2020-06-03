import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/base/button.dart';
import 'package:giftmoney/components/form/form_date_input.dart';
import 'package:giftmoney/components/form/form_input.dart';
import 'package:giftmoney/components/form/form_popup_menu.dart';
import 'package:giftmoney/components/small_parts/image_showcase.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/pages/image_preview_page.dart';
import 'package:giftmoney/service/account_service.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/utils/CommonError.dart';
import 'package:giftmoney/utils/charge_item_check_help.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';
import 'package:giftmoney/utils/screen_util.dart';
import 'package:giftmoney/utils/validation.dart';
import 'package:image_picker/image_picker.dart';

class AddRecordPage extends BaseStatefulPage {
  final SQLTrade trade;
  AddRecordPage({Key key, this.trade}) : super(key: key);

  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends BasePageState<AddRecordPage> {
  Map<String, dynamic> _formValues = {};
  final _formKey = GlobalKey<FormState>();
  SQLTrade trade;
  List<String> images = [];
  final ImagePicker picker = ImagePicker();

  @override
  void initState() { 
    super.initState();
    trade = widget.trade;
  }

  @override
  Widget buildBody(BuildContext context) {
    SQLTradeType initTradeType = trade?.type ?? SQLTradeType.inAccount;
    double spacing = RatioHelper.scalePx(30);
    double formWidth = (ScreenUtil.screenWidthDp - spacing * 3) / 2;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: spacing)),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: spacing)),
              SizedBox(width: formWidth, child: FormPopupMenu<SQLTradeType>(
                label: i18n.form_type,
                validator: Validation.relation,
                initValue: FormPopupMenuValue<SQLTradeType>(value: initTradeType, title: initTradeType == SQLTradeType.inAccount ? i18n.form_in_account : i18n.form_out_account),
                values: [
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.inAccount, title: i18n.form_in_account),
                  FormPopupMenuValue<SQLTradeType>(value: SQLTradeType.outAccount, title: i18n.form_out_account),
                ],
                onSaved: (SQLTradeType type) {
                  _formValues['type'] = type.toString().split('.').last;
                },
              )),
              Padding(padding: EdgeInsets.only(left: spacing)),
              SizedBox(width: formWidth, child: FormInput(
                initialValue: widget.trade?.value?.toString(),
                label: i18n.form_amount,
                validator: Validation.amount,
                keyboardType: TextInputType.number,
                onSaved: (String text) {
                  _formValues['value'] = num.parse(text);
                },
              )),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: spacing)),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: spacing)),
            SizedBox(width: formWidth, child: FormInput(
              label: i18n.form_event_name,
              initialValue: widget.trade?.eventName,
              validator: Validation.eventName,
              onSaved: (String text) {
                _formValues['eventName'] = text;
              },
            )),
            Padding(padding: EdgeInsets.only(left: spacing)),
            SizedBox(width: formWidth, child: FormDateInput(
              label: i18n.form_event_time,
              initialValue: widget.trade?.eventTime,
              validator: Validation.date_notEmpty,
              onSaved: (DateTime date) {
                _formValues['eventTime'] = date.toString();
              },
            ))
          ]),
          Padding(padding: EdgeInsets.only(top: spacing)),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: spacing)),
            SizedBox(width: formWidth, child: FormInput(
              label: i18n.form_relation,
              initialValue: widget.trade?.relationName,
              validator: Validation.relation,
              onSaved: (String text) {
                _formValues['relationName'] = text;
              },
            )),
            Padding(padding: EdgeInsets.only(left: spacing)),
            SizedBox(width: formWidth, child: FormInput(
              label: i18n.form_person_name,
              initialValue: widget.trade?.personName,
              validator: Validation.userName,
              onSaved: (String text) {
                _formValues['personName'] = text;
              },
            )),
          ]),
          ImageShowcase(
            imagePaths: images,
            onAddButtonPress: () {
              showModalBottomSheet(context: context, builder: (BuildContext context) {
                return Column(
                  mainAxisSize: MainAxisSize.min, // 设置最小的弹出
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text("拍照"),
                      onTap: () async {
                        Navigator.pop(context);
                        final pickedFile = await this.picker.getImage(source: ImageSource.camera);
                        this.setState(() {
                          images.add(pickedFile.path);
                        });
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text("相册选择"),
                      onTap: () async {
                        Navigator.pop(context);
                        final pickedFile = await this.picker.getImage(source: ImageSource.gallery);
                        this.setState((){
                          images.add(pickedFile.path);
                        });
                      },
                    ),
                  ],
                );
              });
            },
            onImagePreviewPress: (imagePath) {
              print("onImagePreviewPress:${imagePath}");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                    return ImagePreviewPage(imagePath: imagePath, onDeletePress: () {
                      Navigator.pop(context);
                      this.images.remove(imagePath);
                      this.setState(() {
                        this.images.remove(imagePath);
                      });
                    },);
                })
              );
            },
            onImageDeletePress: () {

            },
          ),
          Container(
            width: ScreenUtil.screenWidthDp - spacing * 2,
            // margin: EdgeInsets.only(left: spacing),
            child: FormInput(
              label: "备注",
              initialValue: widget.trade?.remark,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              height: RatioHelper.scalePx(150),
              onSaved: (String text) {
                _formValues['remark'] = text;
              },
          )),
          Padding(padding: EdgeInsets.only(top: 30)),
          Button(
            title: i18n.bt_save,
            onPressed: () async {
              if(!ChargeItemCheckHelp.canChargeForItem(context, ChargeItem.insertTrade)) {
                return;
              }
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
    if(widget.trade?.uuid != null) {
      trade.uuid = widget.trade?.uuid;
    }
    trade = await TradeService.instance.saveTrade(trade);
    return trade;
  }
}