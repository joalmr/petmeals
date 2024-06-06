import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/shared/widgets/textfield/textfield.dart';

DateFormat format() {
  return DateFormat('dd-MM-yyyy');
}

class BornDate extends StatelessWidget {
  const BornDate({
    super.key,
    required this.controllerDate,
    required this.borndate,
  });
  final TextEditingController controllerDate;
  final ValueNotifier<DateTime> borndate;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controllerDate,
      textField: 'Fecha de nacimiento',
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: borndate.value,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ).then((value) {
          if (value != null) {
            controllerDate.text = format().format(value);
            borndate.value = value;
            Logger().i(borndate);
          }
        });
      },
    );
  }
}
