import 'dart:io';
import 'package:flutter/material.dart';
import 'package:giftmoney/base/base_widget_state.dart';
import 'package:giftmoney/theme/theme.dart';

class LoadingImage extends StatefulWidget {
  final String imageUrl;
  final String imageFilePath;
  final double width;
  final double height;
  final double borderRadius;
  final double progressIndicatorSize;
  LoadingImage({
    this.imageUrl,
    this.imageFilePath,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.progressIndicatorSize = 24,
  });

  @override
  State<StatefulWidget> createState() {
    return _LoadingImageState();
  }
}

class _LoadingImageState extends BaseWidgetState<LoadingImage> {
  ImageProvider _provider;
  String _imgUrl;
  bool _loading = false;
  bool _loadError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    if (widget.imageFilePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image.file(
          File(widget.imageFilePath),
          fit: BoxFit.cover,
          width: widget.width,
          height: widget.height,
        ),
      );
    }
    if (widget.imageUrl != null && _imgUrl != widget.imageUrl) {
      _imgUrl = widget.imageUrl;
      _provider = NetworkImage(widget.imageUrl);
      _loading = true;
      _provider.resolve(ImageConfiguration()).addListener(
            ImageStreamListener(
              (imageInfo, _) {
                setState(() {
                  _loading = false;
                  _loadError = false;
                });
              },
              onError: (exception, stackTrace) {
                print('exception = $exception');
                print('stackTrace = $stackTrace');
                setState(() {
                  _loading = false;
                  _loadError = true;
                });
              },
            ),
          );
    }
    if (_loading) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.grayBackground,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: SizedBox(
            width: widget.progressIndicatorSize,
            height: widget.progressIndicatorSize,
            child: CircularProgressIndicator(strokeWidth: rpx(6)),
          ),
        ),
      );
    }
    if (!_loadError && _provider != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image(
          image: _provider,
          fit: BoxFit.cover,
          width: widget.width,
          height: widget.height,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image.asset(
          'assets/images/img_placeholder_err.jpg',
          fit: BoxFit.cover,
          width: widget.width,
          height: widget.height,
        ),
      );
    }
  }
}
