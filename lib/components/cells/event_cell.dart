import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/model/sql_event.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/format_helper.dart';

class EventCell extends StatefulWidget {
  final SQLEvent event;
  EventCell({Key key, @required this.event}) : super(key: key);

  _EventCellState createState() => _EventCellState();
}

class _EventCellState extends State<EventCell> {
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 0),
      child: Row(
        children: <Widget>[
          //  TradeUploadStateComponent(state: TradeUploadState.notUpload),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.event.eventName, style: AppTextStyle.mainText(15)),
              Text(FormatHelper.dateToString(widget.event.eventTime),
                  style: AppTextStyle.secondaryText(12))
            ],
          ),
          Text("   ${widget.event.count}条数据", style: AppTextStyle.mainText(13)),
          Expanded(child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("+ ${FormatHelper.formatCurrency(widget.event.incomeAmount)}", style: TextStyle(fontSize: 16, color: AppColor.secondaryAppColor)),
                Text("- ${FormatHelper.formatCurrency(widget.event.expendAmount)}", style: TextStyle(fontSize: 16, color: AppColor.mainAppColor)),
              ],
          ))),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
