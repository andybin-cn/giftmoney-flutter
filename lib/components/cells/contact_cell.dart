import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/generated/l10n.dart';
import 'package:giftmoney/model/sql_contact.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/format_helper.dart';

class ContactCell extends StatefulWidget {
  final SQLContact contact;
  ContactCell({Key key, @required this.contact}) : super(key: key);

  _ContactCellState createState() => _ContactCellState();
}

class _ContactCellState extends State<ContactCell> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //  TradeUploadStateComponent(state: TradeUploadState.notUpload),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.contact.contactName, style: AppTextStyle.mainText(13)),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(
                '📝  ${S.of(context).statistics_recordCount(widget.contact.recordsCount.toString())}',
                style: AppTextStyle.reminderText(10)),
          ],
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        '+ ${FormatHelper.formatCurrency(widget.contact.incomeAmount)}',
                        style: TextStyle(
                            fontSize: 14, color: AppColor.mainAppColor)),
                    Text(
                        '- ${FormatHelper.formatCurrency(widget.contact.expendAmount)}',
                        style:
                            TextStyle(fontSize: 14, color: AppColor.mainGreen)),
                  ],
                ))),
        Icon(Icons.keyboard_arrow_right),
      ],
    );
  }
}
