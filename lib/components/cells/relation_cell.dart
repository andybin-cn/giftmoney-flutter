import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/model/sql_relation.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/format_helper.dart';

class RelationCell extends StatefulWidget {
  final SQLRelation relation;
  RelationCell({Key key, @required this.relation}) : super(key: key);

  _RelationCellState createState() => _RelationCellState();
}

class _RelationCellState extends State<RelationCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //  TradeUploadStateComponent(state: TradeUploadState.notUpload),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.relation.relationName, style: AppTextStyle.mainText(13)),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text("   (${I18n.of(context).statisticsContactsCount(widget.relation.contactsCount.toString())})", style: AppTextStyle.reminderText(9)),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text("   (${I18n.of(context).statisticsRecordCount(widget.relation.recordsCount.toString())})", style: AppTextStyle.reminderText(9)),
          ],
        ),
        Expanded(child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("+ ${FormatHelper.formatCurrency(widget.relation.incomeAmount)}", style: TextStyle(fontSize: 14, color: AppColor.secondaryAppColor)),
              Text("- ${FormatHelper.formatCurrency(widget.relation.expendAmount)}", style: TextStyle(fontSize: 14, color: AppColor.mainAppColor)),
            ],
        ))),
        Icon(Icons.keyboard_arrow_right),
      ],
    );
  }
}
