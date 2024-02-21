import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showModaliOS(
  BuildContext context,
  DateTime? initialDateTime,
  void Function(DateTime) onDateTimeChanged,
) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: DefaultTextStyle(
          style: TextStyle(
            color: CupertinoColors.label.resolveFrom(context),
            fontSize: 22,
          ),
          child: CupertinoDatePicker(
            backgroundColor: CupertinoColors.systemBackground,
            mode: CupertinoDatePickerMode.date,
            dateOrder: DatePickerDateOrder.dmy,
            initialDateTime: initialDateTime,
            minimumDate: DateTime(2000),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateTimeChanged,
          ),
        ),
      );
    },
  );
}

showModalAndroid(
  BuildContext context,
  DateTime? initialDate,
  Function(DateTime?) onValue,
) {
  return showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  ).then(onValue);
}
