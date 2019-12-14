import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/components/base/dialog_route.dart';
import 'package:giftmoney/components/base/loading_material.dart';

final _loadingRouteName = 'LoadingRoute';

class LoadingHelper {
  static showLoading(BuildContext context, CancelToken cancelToken, {bool loadingCancelable}) {
    Navigator.of(context).pushAndRemoveUntil(
      DialogRoute(
        settings: RouteSettings(name: _loadingRouteName),
        transitionDuration: const Duration(milliseconds: 50),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return WillPopScope(
            child: LoadingMaterial(),
            onWillPop: () {
              if(loadingCancelable) {
                if (cancelToken != null) {
                  cancelToken.cancel('Permintaan dibatalkan');
                  //返回Future.value(false),back键不会生效，但是前面http请求取消的时候，会抛出异常，异常处理完后，
                  //会调用方法去隐藏loading，并且执行过程会在这个方法返回之前。所以这里的返回值不能让back键生效，否则
                  //这个方法返回的时候再pop一次route栈，界面就会被回退。
                  return Future.value(false);// todo 这里返回了false，界面仍然被回退，之前是不会的，待调查
                } else {
                  //返回Future.value(true),back键会生效
                  return Future.value(true);
                }
              } else {
                return Future.value(false);
              }
            },
          );
        },
      ),
      (route) => route.settings?.name != _loadingRouteName,
    );
  }

  static hideLoading(BuildContext context) {
    if(context != null) {
      Navigator.of(context).popUntil((route) => route.settings?.name != _loadingRouteName);
    }
  }
}
