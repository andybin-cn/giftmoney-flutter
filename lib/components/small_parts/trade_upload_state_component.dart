
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/generated/l10n.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/theme/theme.dart';

class TradeUploadStateComponent extends StatelessWidget {
  final TradeUploadState state;
  const TradeUploadStateComponent({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = 22;
    final double height = 22;
    Image image;
    String text;
    switch (state) {
      case TradeUploadState.notUpload:
        image = Image.asset('assets/images/cloud_upload_wating.png', width: width, height: height);
        text = S.of(context).bt_upload_waiting;
        break;
      case TradeUploadState.uploading:
        image = Image.asset('assets/images/cloud_upload_uploading.png', width: width, height: height);
        text = S.of(context).bt_upload_uploading;
        break;
      case TradeUploadState.success:
        image = Image.asset('assets/images/cloud_upload_success.png', width: width, height: height);
        text = S.of(context).bt_upload_success;
        break;
      case TradeUploadState.warning:
        image = Image.asset('assets/images/cloud_upload_warning.png', width: width, height: height);
        text = S.of(context).bt_upload_waring;
        break;
      default:
        image = Image.asset('assets/images/cloud_upload_wating.png', width: width, height: height);
        text = S.of(context).bt_upload_waiting;
    }
    return ClipOval(child: Container(
      width: 50,
      height: 50,
      color: AppColor.grayBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          image,
          Text(text, style:AppTextStyle.secondaryText(8))
        ],
      ))
    );
  }
}