

import 'package:flutter/material.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';
import 'package:giftmoney/utils/screen_util.dart';

class ImageShowcase extends StatefulWidget {
  final List<String> imagePaths;
  final int maxCount;
  final Function onAddButtonPress;
  final Function onImagePreviewPress;
  final Function onImageDeletePress;

  ImageShowcase({
    Key key,
    this.maxCount = 9,
    this.onAddButtonPress,
    this.onImagePreviewPress,
    this.onImageDeletePress,
    this.imagePaths,
  }) : super(key: key);

  @override
  _ImageShowcaseState createState() => _ImageShowcaseState();

}

class _ImageShowcaseState extends State<ImageShowcase> {

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = List<String>.from(widget.imagePaths);
    var addButtonPath = 'assets/images/tianjiazhaop.png';
    if(imagePaths.length < widget.maxCount) {
      imagePaths.add(addButtonPath);
    }
    const rowCount = 4;
    var imageWidth = RatioHelper.scalePx((ScreenUtil.designWidth - 10 * rowCount - 70) / rowCount) - 0.5;
    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: AppColor.dividerColor, width: 0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.all(RatioHelper.scalePx(20)),
      padding: EdgeInsets.all(RatioHelper.scalePx(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 6)),
          Text("添加图片", style: TextStyle(
            color: AppColor.secondaryText,
            fontSize: RatioHelper.scalePx(28),
          )),
          Padding(padding: EdgeInsets.only(top: 6)),
          Container(
            width: RatioHelper.scalePx(ScreenUtil.designWidth - 60.0),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              spacing: RatioHelper.scalePx(10),
              runSpacing: RatioHelper.scalePx(10),
              children: imagePaths.map((path) {
                return SizedBox(
                  width: imageWidth,
                  height: imageWidth,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Image.asset(path, width: imageWidth, height: imageWidth, fit: BoxFit.fill),
                    onPressed: () {
                      var isAddButton = addButtonPath == path;
                      print("image pressed, isAddButton:${isAddButton}");
                      if(isAddButton) {
                        widget.onAddButtonPress();
                      } else {
                        widget.onImagePreviewPress(path);
                      }
                    },
                  )
                );
              }).toList(),
            )
          )
        ],
      )
    );
  }
}