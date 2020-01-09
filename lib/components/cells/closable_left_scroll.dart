

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClosableLeftScroll extends StatefulWidget {

  final Key key;

  final bool closeOnPop;
  final Widget child;
  final VoidCallback onTap;
  final double buttonWidth;
  final List<Widget> buttons;

  final Function(double) onScroll;

  final VoidCallback onTouch;
  final VoidCallback onSlideStarted;

  final VoidCallback onSlideCompleted;

  final VoidCallback onSlideCanceled;
  final VoidCallback onEnd;

  ClosableLeftScroll({
    this.key,
    @required this.child,
    @required this.buttons,
    this.onSlideStarted,
    this.onSlideCompleted,
    this.onSlideCanceled,
    this.onTap,
    this.buttonWidth: 80.0,
    this.onScroll,
    this.closeOnPop: true,
    this.onEnd,
    this.onTouch,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ClosableLeftScrollState();
  }
}

class ClosableLeftScrollState extends State<ClosableLeftScroll>
    with TickerProviderStateMixin {
  double translateX = 0;
  double maxDragDistance;
  final Map<Type, GestureRecognizerFactory> gestures =
      <Type, GestureRecognizerFactory>{};

  AnimationController animationController;
  static StreamController<ClosableLeftScrollState> _willOpenEvents = StreamController<ClosableLeftScrollState>.broadcast();
  static closeAll() {
    ClosableLeftScrollState._willOpenEvents.add(null);
  }

  StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    subscription = ClosableLeftScrollState._willOpenEvents.stream.listen((state) {
      if(state != this && !_isHold) {
        this.close();
      }
    });
    maxDragDistance = widget.buttonWidth * widget.buttons.length;
    gestures[HorizontalDragGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<HorizontalDragGestureRecognizer>(
      () => HorizontalDragGestureRecognizer(debugOwner: this),
      (HorizontalDragGestureRecognizer instance) {
        instance
          ..onStart = onHorizontalDragStart
          ..onDown = onHorizontalDragDown
          ..onUpdate = onHorizontalDragUpdate
          ..onEnd = onHorizontalDragEnd;
      },
    );

    gestures[TapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
      () => TapGestureRecognizer(debugOwner: this),
      (TapGestureRecognizer instance) {
        instance..onTap = () {
          this.close();
          ClosableLeftScrollState.closeAll();
          widget.onTap?.call();
        };
      },
    );

    animationController = AnimationController(
        lowerBound: -maxDragDistance,
        upperBound: 0,
        vsync: this,
        duration: Duration(milliseconds: 300))
      ..addListener(() {
        translateX = animationController.value;
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Stack(
      children: <Widget>[
        Positioned.fill(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: widget.buttons
              .map<Widget>((button) => Container(
                    child: button,
                    width: widget.buttonWidth,
                  ))
              .toList()
              .reversed
              .toList(),
        )),
        RawGestureDetector(
          gestures: gestures,
          child: Transform.translate(
            offset: Offset(translateX, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: widget.child,
                )
              ],
            ),
          ),
        )
      ],
    );
    return widget.closeOnPop
        ? WillPopScope(
            child: body,
            onWillPop: () async {
              if (translateX != 0) {
                close();
                return false;
              }
              return true;
            })
        : body;
  }

  void onHorizontalDragStart(DragStartDetails details) {
    // widget.onSlideStarted?.call();
    _isHold = true;
    ClosableLeftScrollState._willOpenEvents.add(this);
  }

  void onHorizontalDragDown(DragDownDetails details) {
    widget.onTouch?.call();
  }

  bool _isHold = false;
  bool _hasCall = false;

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    translateX = (translateX + details.delta.dx).clamp(-maxDragDistance, 0.0);
    if (!_hasCall && details.primaryDelta < 0) {
      widget.onSlideStarted?.call();
      _hasCall = true;
    }
    widget.onScroll?.call(
      translateX / maxDragDistance * -1,
    );

    setState(() {});
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    animationController.value = translateX;
    _hasCall = false;
    _isHold = false;
    if (details.velocity.pixelsPerSecond.dx > 200) {
      close();
    } else if (details.velocity.pixelsPerSecond.dx < -200) {
      open();
    } else {
      if (translateX.abs() > maxDragDistance / 2) {
        open();
      } else {
        close();
      }
    }
  }

  void open() {
    widget.onEnd?.call();
    if (translateX != -maxDragDistance)
      animationController.animateTo(-maxDragDistance).then((_) {
        if (widget.onSlideCompleted != null) widget.onSlideCompleted.call();
      });
  }

  void close() {
    if (translateX != 0)
      animationController.animateTo(0).then((_) {
        if (widget.onSlideCanceled != null) widget.onSlideCanceled.call();
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    subscription?.cancel();
    super.dispose();
  }
}


class LeftScrollItem extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color textColor;
  final Color color;
  const LeftScrollItem({
    Key key,
    this.onTap,
    this.text,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // width: 80,
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}