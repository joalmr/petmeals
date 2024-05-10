import 'package:flutter/material.dart';

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
