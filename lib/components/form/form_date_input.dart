

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/utils/format_helper.dart';
import 'package:giftmoney/utils/validation.dart';

import 'form_input.dart';

class FormDateInput extends FormField<DateTime> {
  final String label;
  final DateTime initialValue;
  // final FormFieldValidator<DateTime> validator;

  FormDateInput({Key key,
    this.initialValue,
    FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime> validator,
    this.label
  }) : 
    super(key: key,
      validator: validator,
      onSaved: onSaved,
      builder: (FormFieldState<DateTime> field) {
        final _FormDateInputState state = field;
        return state.buildBody();
      }
    );

  @override
  FormFieldState<DateTime> createState() => _FormDateInputState();
}

class _FormDateInputState extends FormFieldState<DateTime> {
  final _fieldController = TextEditingController();
  var time = DateTime.now();

  @override
  void initState() { 
    super.initState();
    time = widget.initialValue ?? DateTime.now();
    if(widget.initialValue != null) {
      _fieldController.text = FormatHelper.dateToString(widget.initialValue);
    }
  }
  _showDataPicker() async {
    print("_showDataPicker start");
    Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
        context: context,
        initialDate: time,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
        locale: myLocale);
    print("_showDataPicker end");
    print("_showDataPicker picker:$picker");
    if (picker != null) {
      setState(() {
        time = picker;
      });
      _fieldController.text = FormatHelper.dateToString(picker);
      didChange(time);
    }
  }

  @override
  FormDateInput get widget => super.widget;

  Widget buildBody() {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        print("FormDateInput onTaped");
        _showDataPicker();
      },
      child: FormInput(
        controller: _fieldController,
        label: widget.label,
        validator: Validation.notEmpty,
        enabled: false,
      )
    );
  }
}
