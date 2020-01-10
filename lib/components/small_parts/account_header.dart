import 'package:flutter/material.dart';
import 'package:giftmoney/utils/screen_util.dart';

class AccountHeader extends StatefulWidget with PreferredSizeWidget {
  AccountHeader({Key key}) : super(key: key);

  @override
  _AccountHeaderState createState() => _AccountHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(200);
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    return 
    ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
      child: Container(
        color: Colors.red,
        height: 200,
        width: 1000,
        child: Text("data"),
    ),
    )
    ;
  }
}