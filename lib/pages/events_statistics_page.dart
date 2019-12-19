import 'package:flutter/widgets.dart';
import 'package:giftmoney/base/base_stateful_page.dart';
import 'package:giftmoney/pages/home_record_page.dart';

class EventsStatisticsPage extends BaseStatefulPage {
  EventsStatisticsPage({Key key}) : super(key: key);

  @override
  _EventsStatisticsPageState createState() => _EventsStatisticsPageState();
}

class _EventsStatisticsPageState extends BasePageState<EventsStatisticsPage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: HomeRecordPage(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}