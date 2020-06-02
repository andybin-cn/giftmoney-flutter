
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';

class PrivacyPolicyPage extends BaseStatefulPage {
  PrivacyPolicyPage({Key key}) : super(key: key);

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends BasePageState<PrivacyPolicyPage> {

  @override
  void initState() {
    super.initState();
    title = I18nUtil.shared.minePrivacy;
  }
  @override
  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          Text('礼金小助手隐私政策', style: AppTextStyle.mainText(15)),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text('''
            
礼金小助手对您发布在互联网上的隐私非常敏感，我们认为让您了解我们如何处理我们通过互联网获得的与您有关的信息非常重要。我们将尽力保护您的数据。

如您想了解更加详尽的信息，请仔细阅读以下章节：
1.我们收集的信息

在您使用礼金小助手的过程中，我们会为了您的数据安全，提供数据备份功能，如果不搜集，我们可能无法向您提供我们的产品或服务。 我们只会收集具有特定、明确及合法的目的所必需的信息，而不会以与这些目的不相符的方式进一步处理相关信息。

2.信息的存储

我们会按照法律法规规定，将境内收集的用户设备数据存储于中国境内。

3.信息安全

我们努力为用户的信息安全提供保障，以防止信息的丢失、不当使用、未经授权访问或披露。 我们将在合理的安全水平内使用各种安全保护措施以保障信息的安全。

4.条款变更

我们可能会适时对本政策进行修订。当政策的条款发生变更时，我们会在您登录及版本更新时以推送通知、弹窗的形式向您展示变更后的政策。请您注意，只有在您点击同意按钮/勾选确认后，我们才会按照更新后的指引收集、使用、存储您的设备数据，同时当您点击同意按钮/勾选确认后视为您完全理解并接受此隐私政策。

5.与我们联系

当您有其他的投诉、建议、未成年人设备数据相关问题时，请发送邮件至reciprocityApp@163.com。 我们将尽快审核所涉问题，并在验证您的用户身份后的三十天内予以回复。

《礼金小助手》工作室
          ''', style: AppTextStyle.mainText(15)),
        ])
    );
  }
}