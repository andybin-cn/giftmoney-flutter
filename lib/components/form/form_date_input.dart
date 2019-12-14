

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giftmoney/utils/format_helper.dart';
import 'package:giftmoney/utils/validation.dart';

import 'form_input.dart';

class FormDateInput extends FormField<DateTime> {
  final String label;
  // final FormFieldValidator<DateTime> validator;

  FormDateInput({Key key,
    DateTime initialValue,
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
    return FormInput(
      focusNode: FocusNode(canRequestFocus: false),
      controller: _fieldController,
      label: widget.label,
      validator: Validation.notEmpty,
      onTap: () {
        print("FormDateInput onTaped");
        _showDataPicker();
      },
    );
  }
}
