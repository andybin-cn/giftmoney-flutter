import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/model/sql_trade.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/format_helper.dart';

class TradeCell extends StatefulWidget {
  final SQLTrade trade;
  TradeCell({Key key, @required this.trade}) : super(key: key);

  _TradeCellState createState() => _TradeCellState();
}

class _TradeCellState extends State<TradeCell> {
  @override
  Widget build(BuildContext context) {
    String relationName = widget.trade.relationName;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          //  TradeUploadStateComponent(state: TradeUploadState.notUpload),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding( padding: EdgeInsets.only(top: 8, bottom: 4), child: Row(children: <Widget>[
                Text(widget.trade.personName, style: AppTextStyle.mainText(15)),
                Text("($relationName)", style: AppTextStyle.reminderText(12))
              ])),
              Text(widget.trade.eventName,
                  style: AppTextStyle.secondaryText(14))
            ],
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(widget.trade.formatValue, style: TextStyle(fontSize: 16, color: widget.trade.type == SQLTradeType.inAccount ? AppColor.secondaryAppColor : AppColor.mainAppColor))),
              Text(FormatHelper.dateToString(widget.trade.eventTime), style: AppTextStyle.secondaryText(12)),
            ],
          )),
        ],
      ),
    );
  }
}
