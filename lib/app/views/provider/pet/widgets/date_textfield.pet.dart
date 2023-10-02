import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePetWidget extends MyDateTextFieldAdaptive {
  const DatePetWidget({
    super.key,
    required super.textField,
    required super.controller,
  });
}

format() {
  return DateFormat('dd-MM-yyyy');
}

//ios
abstract class MyDateTextFieldAdaptive extends StatefulWidget {
  final String textField;
  final TextEditingController controller;

  const MyDateTextFieldAdaptive({
    super.key,
    required this.textField,
    required this.controller,
  });

  @override
  State<MyDateTextFieldAdaptive> createState() => _MyDateTextFieldAdaptive();
}

class _MyDateTextFieldAdaptive extends State<MyDateTextFieldAdaptive> {
  bool texting = false;
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    widget.controller.text = format().format(date);
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    return dateiOS(context, petProvider);
  }

  Widget dateiOS(BuildContext context, PetProvider petProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 0, left: 4, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textField,
            style: const TextStyle(fontSize: 10),
          ),
          CupertinoTextField(
            controller: widget.controller,
            readOnly: true,
            onTap: () => showModalAndroid(petProvider),
            placeholderStyle: const TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              overflow: TextOverflow.fade,
            ),
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateAndroid(BuildContext context, PetProvider petProvider) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        onTap: () => showModalAndroid(petProvider),
        decoration: InputDecoration(
          labelText: widget.textField,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4,
          ),
          filled: true,
          fillColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
          ),
        ),
      ),
    );
  }

  showModaliOS(PetProvider petProvider) {
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
              initialDateTime: date,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (value) {
                setState(() {
                  date = value;
                  widget.controller.text = format().format(date);
                  petProvider.borndate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }

  showModalAndroid(PetProvider petProvider) {
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((value) {
      date = value!;
      widget.controller.text = format().format(date);
      petProvider.borndate = date;
    });
  }
}
