import 'package:flutter/material.dart';

class SettingCell extends StatelessWidget {
  final StatelessWidget label;
  final StatelessWidget icon;
  final VoidCallback onPressed;
  const SettingCell({Key key, @required this.onPressed, @required this.label, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 0.5),
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 15)),
            this.icon,
            Padding(padding: EdgeInsets.only(left: 8)),
            Expanded(child: this.label),
            Icon(Icons.arrow_forward_ios),
            Padding(padding: EdgeInsets.only(left: 15)),
          ],
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
