import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateless_page.dart';
import 'package:giftmoney/generated/l10n.dart';

class ImagePreviewPage extends BaseStatelessPage {
  final String imagePath;
  final Function onDeletePress;

  ImagePreviewPage({Key key, this.imagePath, this.onDeletePress}) : super(key: key, title: '图片预览');

  Widget buildAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(rpx(88)),
        child: AppBar(
          centerTitle: true,
          title: Text(this.title),
          actions: <Widget>[
            FlatButton(
              child: Text('删除'),
              onPressed: this.onDeletePress)
          ],
        ),
      );
  }

  @override
  Widget buildBody(BuildContext context) {
    var i18n = S.of(context);
    return Container(
      child: Image.asset(this.imagePath)
    );
  }
}
