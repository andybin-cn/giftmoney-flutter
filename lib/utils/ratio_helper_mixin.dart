import 'package:giftmoney/utils/screen_util.dart';

class RatioHelper {
  //缩放像素，传递设计稿的像素尺寸，不需要除以2
  double rpx(double width) {
    return width * ScreenUtil.widthScale;
  }

  //无法使用mixin的地方使用static方法
  static double scalePx(double width) {
    return width * ScreenUtil.widthScale;
  }

}
