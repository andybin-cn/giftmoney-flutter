import 'package:flutter/material.dart';
import 'package:giftmoney/theme/theme.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';

class FormInput extends StatefulWidget {
  final BuildContext context;
  final GlobalKey<FormFieldState> formFieldKey;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType keyboardType;
  final String label;
  final String initialValue;
  final bool obscureText;
  final Function onSaved;
  final bool enabled;
  final FormFieldValidator<String> validator;
  final GestureTapCallback onTap;
  final FocusNode focusNode;
  final int maxLines;
  final double height;

  FormInput(
      {this.context,
      this.formFieldKey,
      this.controller,
      this.maxLength,
      this.keyboardType,
      this.label,
      this.initialValue,
      this.obscureText = false,
      this.enabled = true,
      this.onSaved,
      this.validator,
      this.onTap,
      this.maxLines = 1,
      this.height = 50,
      this.focusNode})
      : assert(initialValue == null || controller == null);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<FormInput> {
  bool _autovalidate = false;
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        this.setState(() {
          _autovalidate = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: AppColor.dividerColor, width: 0.5),
        borderRadius: new BorderRadius.circular(6),
      ),
      padding: EdgeInsets.only(
        left: RatioHelper.scalePx(10),
        right: RatioHelper.scalePx(10),
      ),
      height: widget.height,
      child: TextFormField(
        key: widget.formFieldKey,
        controller: widget.controller,
        focusNode: _focusNode,
        autovalidate: _autovalidate,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        style: TextStyle(
          color: AppColor.mainBlackText,
          fontSize: RatioHelper.scalePx(Maudimen.formFieldTextSizeRpx),
          height: 1.2,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: AppColor.secondaryText,
            fontSize: RatioHelper.scalePx(28),
          ),
          errorStyle: TextStyle(fontSize: RatioHelper.scalePx(20)),
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.only(
            left: RatioHelper.scalePx(0),
            top: RatioHelper.scalePx(Maudimen.formFieldVerPaddingRpx),
            right: RatioHelper.scalePx(0),
            bottom: RatioHelper.scalePx(Maudimen.formFieldVerPaddingRpx),
          ),
        ),
        onTap: widget.onTap,
        obscureText: widget.obscureText,
        onSaved: (String value) {
          if (widget.onSaved != null) {
            widget.onSaved(value);
          }
        },
        onFieldSubmitted: (String value) {
          debugPrint('onFieldSubmitted value=' + value);
        },
        onEditingComplete: () {
          debugPrint('onEditingComplete...');
        },
        validator: widget.validator,
      ),
    );
  }
}
