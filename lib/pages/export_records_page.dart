import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/components/cells/closable_left_scroll.dart';
import 'package:giftmoney/service/trade_service.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/format_helper.dart';
import 'package:giftmoney/utils/i18n_util.dart';
import 'package:giftmoney/utils/native_utils.dart';

class ExportRecordsPage extends BaseStatefulPage {
  ExportRecordsPage({Key key}) : super(key: key);

  @override
  _ExportRecordsPageState createState() => _ExportRecordsPageState();
}

class _ExportRecordsPageState extends BasePageState<ExportRecordsPage> {
  List<FileSystemEntity> files = List<FileSystemEntity>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    title = I18nUtil.shared.accessibility_history_button;
    Timer(Duration(milliseconds: 100), () => _refreshKey.currentState.show());
  }

  @override
  Widget buildSelfScrollBody(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _onRefresh,
      child: ListView.separated(
        // physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 0.5),
        itemBuilder: _renderRow,
        itemCount: files.length,
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    var file = files[index];
    var fileName =
        file.path.substring(file.path.lastIndexOf('/') + 1, file.path.length);
    return ClosableLeftScroll(
        child: FutureBuilder<FileStat>(
          future: file.stat(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            FileStat fileStat = snapshot.data;
            var createTime = fileStat?.changed;
            var size = fileStat?.size;
            return Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Text(fileName, style: AppTextStyle.mainText(13)),
                        Padding(padding: EdgeInsets.only(top: 4)),
                        Text(FormatHelper.datetimeToString(createTime),
                            style: AppTextStyle.secondaryText(10)),
                        Padding(padding: EdgeInsets.only(top: 15)),
                      ],
                    ),
                  ),
                  Text(FormatHelper.formatSize(size),
                      style: AppTextStyle.secondaryText(13)),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Icon(Icons.share, color: Colors.grey),
                ],
              ),
            );
          },
        ),
        onTap: () async {
          var file = files[index];
          try {
            print('Share.shareFiles path: ${file.path}');
            var result = await FlutterShare.shareFile(
                title: 'title', filePath: file.path);
            print('Share.shareFiles success: ${result}');
          } catch (e) {
            print('Share.shareFiles error: ${e}');
          }
        },
        buttons: <Widget>[
          LeftScrollItem(
            text: i18n.bt_delete,
            color: Colors.red,
            onTap: () async {
              ClosableLeftScrollState.closeAll();
              this.showLoading();
              var file = files[index];
              await file.delete();
              files.removeAt(index);
              this.hideLoading();
              this.setState(() {});
            },
          ),
        ]);
  }

  Future<Null> _onRefresh() async {
    var path = await TradeService.instance.getRecodsPath();
    var directory = Directory(path);
    Stream<FileSystemEntity> entityList = directory.list(followLinks: false);
    var newFiles = List<FileSystemEntity>();
    await for (FileSystemEntity entity in entityList) {
      if (await FileSystemEntity.isFile(entity.path)) {
        newFiles.add(entity);
      }
    }
    setState(() {
      this.files = newFiles;
    });
  }
}
