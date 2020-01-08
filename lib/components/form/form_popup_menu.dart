

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/utils/ratio_helper_mixin.dart';
import 'package:giftmoney/utils/validation.dart';

import 'form_input.dart';

class FormPopupMenuValue<T> {
  T value;
  String title;
  FormPopupMenuValue({this.value, this.title});
}

class FormPopupMenu<T> extends FormField<T> {
  final List<FormPopupMenuValue<T>> values;
  final FormPopupMenuValue<T> initValue;
  final String label;

  FormPopupMenu({Key key,
    this.values,
    FormPopupMenuValue initialValue,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<String> validator,
    this.initValue,
    this.label
  }) : 
    super(key: key,
      onSaved: onSaved,
      builder: (FormFieldState<T> field) {
        final _FormPopupMenuState<T> state = field;
        return state.buildBody();
      }
    );

  @override
  FormFieldState<T> createState() => _FormPopupMenuState();
}

class _FormPopupMenuState<T> extends FormFieldState<T> {
  FormPopupMenuValue<T> selectedValue;
  final _fieldController = TextEditingController();

  onSelected(FormPopupMenuValue<T> newValue) {
    _fieldController.text = newValue.title;
    setState(() {
      selectedValue = newValue;
    });
    didChange(selectedValue.value);
  }
  @override
  T get value => selectedValue.value;

  @override
  FormPopupMenu<T> get widget => super.widget;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initValue;
    _fieldController.text = selectedValue.title;
  }

  Widget buildBody() {
    return Container(
      child: PopupMenuButton<FormPopupMenuValue>(
        initialValue: selectedValue,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            FormInput(
              controller: _fieldController,
              label: widget.label,
              validator: widget.validator ?? Validation.notEmpty,
              enabled: false,
            ),
            Positioned(child: Icon(Icons.arrow_drop_down_circle), right: RatioHelper.scalePx(15)),
          ],
        ),
        onSelected: (newValue) {
          onSelected(newValue);
        },
        itemBuilder: (BuildContext content) {
          return widget.values.map((item) {
            return PopupMenuItem<FormPopupMenuValue>(value: item, child: Text(item.title));
          }).toList();
        }
      ),
    );
  }
}