import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/setting_cell.dart';
import 'package:giftmoney/components/small_parts/account_header.dart';
import 'package:giftmoney/pages/mine_about_page.dart';
import 'package:giftmoney/pages/privacy_policy_page.dart';
import 'package:giftmoney/pages/rules_for_gold_coins_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

class HomeMinePage extends BaseStatefulPage {
  HomeMinePage({Key key}) : super(key: key);

  @override
  _HomeMinePageState createState() => _HomeMinePageState();
}

class _HomeMinePageState extends BasePageState<HomeMinePage> {
  @override
  void initState() {
    super.initState();
    title = "我的";
  }

  @override
  Widget buildBody(BuildContext context) {
    return DecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          AccountHeader(),
          Padding(padding: EdgeInsets.only(top: 0.5)),
          SettingCell(
            icon: Icon(Icons.account_balance_wallet),
            label: Text(i18n.mine_coin_rules),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                    return RulesForGoldCoinsPage();
                })
              );
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          SettingCell(
            icon: Icon(Icons.share),
            label: Text(i18n.mine_invite),
            onPressed: () async {
              var shareParams = SSDKMap()
                ..setGeneral(
                  '轻松记录每一笔份子钱',
                  null,
                  [],
                  null,
                  null,
                  'https://android.myapp.com/myapp/detail.htm?apkName=com.andybin.giftmoney',
                  null,
                  null,
                  null,
                  null,
                  SSDKContentTypes.webpage
                );
              // await ShareSDK.showMenu(null, shareParams, 
              //   (state, platform, info, detail, error) {
              //     print('share state:${state} platform:${platform.name} info:${info.toString()} detail:${detail.toString()} error:${error.toString()}');
              //   });
              var platforms = [
                ShareSDKPlatforms.wechatSession,
                ShareSDKPlatforms.wechatTimeline,
                ShareSDKPlatforms.qq,
                ShareSDKPlatforms.qZone,
                ShareSDKPlatforms.sina,
                ShareSDKPlatforms.facebook,
                ShareSDKPlatforms.twitter, ];
              SharesdkPlugin.showMenu(platforms, shareParams, (SSDKResponseState state, ShareSDKPlatform platform, Map userData, Map contentEntity, SSDKError error) {
                print('share state:${state} platform:${platform.name} info:${userData.toString()} detail:${contentEntity.toString()} error:${error.toString()}');
              });
              // await ShareUtil.showMenu(context, shareParams, 
              //   (state, platform, info, detail, error) {
              //     print('share state:${state} platform:${platform.name} info:${info.toString()} detail:${detail.toString()} error:${error.toString()}');
              //   });
            },
          ),
          SettingCell(
            icon: Icon(Icons.info_outline),
            label: Text(i18n.mine_about),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                    return MineAboutPage();
                })
              );
            },
          ),
          SettingCell(
            icon: Icon(Icons.feedback),
            label: Text(i18n.mine_feedback),
            onPressed: () async {
              final Email email = Email(
                body: '\n\n感谢您的宝贵意见，我们会尽快给您回复。谢谢！',
                subject: '【礼金小助手App】意见反馈',
                recipients: ['reciprocityApp@163.com'],
                // cc: ['cc@example.com'],
                // bcc: ['bcc@example.com'],
                // attachmentPath: '/path/to/attachment.zip',
                isHTML: false,
              );
              await FlutterEmailSender.send(email).catchError((error) {
                this.showAlert(
                  desc: '无法打开邮件，您可以发送邮件至 reciprocityApp@163.com 我们会尽快给您回复!',
                  buttons: [
                    DialogButton(child: Text('取消'), onPressed: () {
                      Navigator.pop(context);
                    }),
                    DialogButton(child: Text('复制邮箱地址'), onPressed: () {
                      Clipboard.setData(new ClipboardData(text: 'reciprocityApp@163.co'));
                      showHUD('邮箱地址已复制');
                      Navigator.pop(context);
                    }),
                  ],
                );
                // 
              });
            },
          ),SettingCell(
            icon: Icon(Icons.lock_outline),
            label: Text(i18n.mine_privacy),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                    return PrivacyPolicyPage();
                })
              );
            },
          )
        ],
      ),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
    );
  }
}