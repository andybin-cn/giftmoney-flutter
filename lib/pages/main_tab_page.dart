
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/pages/add_record_page.dart';
import 'package:giftmoney/pages/home_accessibility_page.dart';
import 'package:giftmoney/pages/home_chart_page.dart';
import 'package:giftmoney/pages/home_mine_page.dart';
import 'package:giftmoney/pages/home_record_page.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/utils/screen_util.dart';


class MainTabPage extends BaseStatefulPage {

  MainTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainTabPageState();
}

class _MainTabPageState extends BasePageState<MainTabPage> {
  int currentIndex = 0;
  int oldIndex = 0;
  List<Widget> controllers = [
      HomeRecordPage(),
      HomeChartPage(),
      HomeAccessibilityPage(),
      HomeMinePage(),
    ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildContainer(BuildContext context) {
    ScreenUtil.init(context, 750, 1334);
    I18nUtil.setContext(context);
    print('I18nUtil.locale:${I18nUtil.locale}');
    print('I18nUtil.share.tab_record:${I18nUtil.shared.tab_record}');
    print('I18n.of(context).tab_record:${I18n.of(context).tab_record}');
    
    int index = currentIndex == 2 ? oldIndex : (currentIndex > 2 ? currentIndex - 1 : currentIndex);
    return Scaffold(
      body: IndexedStack(index: currentIndex > 2 ? currentIndex - 1 : currentIndex, children: controllers),
      bottomNavigationBar: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children:[
            Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoTabBar(
                iconSize: 22,
                currentIndex: currentIndex,
                onTap: (i) {
                  if (i == 2) {
                    return;
                  }
                  setState(() {
                    oldIndex = index;
                    currentIndex = i;
                  });
                },
                items: [
                  BottomNavigationBarItem(title: Text(I18n.of(context).tab_record), icon: Icon(Icons.dock)),
                  BottomNavigationBarItem(title: Text(I18n.of(context).tab_chart), icon: Icon(Icons.table_chart)),
                  BottomNavigationBarItem(icon: Container(width: 100, height: 100)),
                  BottomNavigationBarItem(title: Text(I18n.of(context).tab_accessibility), icon: Icon(Icons.settings)),
                  BottomNavigationBarItem(title: Text(I18n.of(context).tab_mine), icon: Icon(Icons.person))
                ],
              )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                  child: Image.asset('assets/images/icons8-add_filled.png', width: 40, height: 40),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                          return AddRecordPage();
                      }));
                  },
                )
            ),
          ]
        )]
      ),
    );
  }
}