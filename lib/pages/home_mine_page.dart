import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_stateful_page.dart';

class HomeMinePage extends BaseStatefulPage {
  HomeMinePage({Key key}) : super(key: key);

  @override
  _HomeMinePageState createState() => _HomeMinePageState();
}

class _HomeMinePageState extends State<HomeMinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("HomeMinePage"),
    );
  }
}