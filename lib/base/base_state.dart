import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftmoney/generated/i18n.dart';
import 'package:giftmoney/utils/loading_helper.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';
import 'package:giftmoney/utils/toast_util.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

typedef LoadingProcessFunc = Future<dynamic> Function(CancelToken cancelToken);

abstract class BaseState<T extends StatefulWidget> extends State<T> with RatioHelper {

  showHUD(String message) {
    hideLoading();
    ToastUtil.show(message);
  }

  showLoading({bool loadingCancelable = true, CancelToken cancelToken}) async {
    //添加一下延时，由于loading是一个route，有些界面一进去就要loading，在这些界面build完成之前显示loading就会出问题
    LoadingHelper.showLoading(context, cancelToken, loadingCancelable: loadingCancelable);
  }

  showAlert({String title, String desc, AlertType type = AlertType.info,
   List<DialogButton> buttons}) {
    Alert(
      context: context,
      type: type,
      title: title,
      desc: desc,
      buttons: buttons ?? [
        DialogButton(child: Text(
          I18n.of(context).alertOk_button,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () => Navigator.pop(context))
      ],
    ).show();
  }

  hideLoading() async {
    LoadingHelper.hideLoading(context);
  }

  //包装需要显示loading的异步方法
  loadingProcessWrapper(LoadingProcessFunc loadingProcessFunc,
      {bool loadingCancelable = true, bool rethrowErr = false}) async {
    try {
      CancelToken cancelToken = CancelToken();
      await this.showLoading(loadingCancelable: loadingCancelable, cancelToken: cancelToken);
      return await loadingProcessFunc(cancelToken);
    } catch (error) {
      if(rethrowErr) {
        rethrow;
      } else {
        this.catchError(error);
      }
    } finally {
      this.hideLoading();
    }
  }

  catchError(Object error, [StackTrace stack]) {
    print(stack);
    showHUD(error.toString());
  }
}
