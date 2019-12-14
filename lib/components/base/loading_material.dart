import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_widget.dart';
import 'package:giftmoney/theme/theme.dart';

class LoadingMaterial extends BaseStatelessWidget {
  @override
  Widget buildBody(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(rpx(8)))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(rpx(45), rpx(40), rpx(45), rpx(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: rpx(68),
                  height: rpx(68),
                  child: CircularProgressIndicator(strokeWidth: rpx(6)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: rpx(40)),
                  child: Text('Pemuatan ...', style: TextStyle(fontSize: rpx(24), color: AppColor.secondaryText)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
