import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/utils/screen_util.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

class ShareUtil {
  static var platforms = [
    ShareSDKPlatforms.wechatSession,
    ShareSDKPlatforms.wechatTimeline,
    ShareSDKPlatforms.qZone,
    ShareSDKPlatforms.qq,
    // ShareSDKPlatforms.sina,
    // ShareSDKPlatforms.douBan,
    // ShareSDKPlatforms.facebook,
    // ShareSDKPlatforms.twitter,
    // ShareSDKPlatforms.mail
  ];
  static Future<void> showMenu(
      BuildContext context,
      SSDKMap params,
      Function(SSDKResponseState, ShareSDKPlatform, Map, Map, SSDKError)
          result) async {
    var avalablePlatforms = List<ShareSDKPlatform>();
    if (Platform.isIOS) {
      for (var item in platforms) {
        try {
          if (await SharesdkPlugin.isClientInstalled(item)) {
            avalablePlatforms.add(item);
          }
        } catch (e) {
          //ignore
          print('isClientInstalled error:${e}');
        }
      }
    } else {
      avalablePlatforms = platforms;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(30),
          child: Wrap(
            children: avalablePlatforms.map((item) {
              return widgetForItem(item, context, params, result);
            }).toList(),
          ),
        );
      },
    );
  }

  static Widget widgetForItem(ShareSDKPlatform platform, BuildContext context, SSDKMap params, Function(SSDKResponseState, ShareSDKPlatform, Map, Map, SSDKError) result) {
    Image icon = Image.asset('assets/images/share.jpeg', width: 50, height: 50);
    var title = I18n.of(context).shareOther;
    if(platform == ShareSDKPlatforms.wechatTimeline) {
      icon = Image.asset('assets/images/wechatTimeline.jpeg', width: 50, height: 50);
      title = I18n.of(context).shareWechatTimeline;
    } else if(platform == ShareSDKPlatforms.qZone) {
      icon = Image.asset('assets/images/qZone.jpg', width: 50, height: 50);
      title = I18n.of(context).shareQZone;
    } else if(platform == ShareSDKPlatforms.sina) {
      icon = Image.asset('assets/images/sina-icon.png', width: 50, height: 50);
      title = I18n.of(context).shareSina;
    } else if(platform == ShareSDKPlatforms.douBan) {
      icon = Image.asset('assets/images/doeban.jpeg', width: 50, height: 50);
      title = I18n.of(context).shareDouBan;
    } else if(platform == ShareSDKPlatforms.facebook) {
      icon = Image.asset('assets/images/Facebook_icon.png', width: 50, height: 50);
      title = I18n.of(context).shareFacebook;
    } else if(platform == ShareSDKPlatforms.twitter) {
      icon = Image.asset('assets/images/Twitter_NEW.png', width: 50, height: 50);
      title = I18n.of(context).shareTwitter;
    } else if(platform == ShareSDKPlatforms.qq) {
      icon = Image.asset('assets/images/qq.png', width: 50, height: 50);
      title = I18n.of(context).shareQq;
    } else if(platform == ShareSDKPlatforms.wechatSession) {
      icon = Image.asset('assets/images/wechat.png', width: 50, height: 50);
      title = I18n.of(context).shareWechat;
    }

    return Container(
      padding: EdgeInsets.only(top: 15),
      width: (ScreenUtil.screenWidthDp - 60) / 3,
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            icon,
            Text(title),
          ],
        ),
        onPressed: () async {
        var shareResult = await SharesdkPlugin.share(platform, params, (state, info, detail, error) {
          result(state, platform, info, detail, error);
        });
        print('shareResult:${shareResult}');
      },
      ),
    );
  }

}
