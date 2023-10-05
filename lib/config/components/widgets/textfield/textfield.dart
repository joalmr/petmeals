import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends MyTextFieldIOS {
  const MyTextField({
    required super.textField,
    super.key,
    super.controller,
  });
}

//ios
abstract class MyTextFieldIOS extends StatefulWidget {
  const MyTextFieldIOS({
    required this.textField,
    super.key,
    this.controller,
  });
  final String textField;
  final TextEditingController? controller;

  @override
  State<MyTextFieldIOS> createState() => _TextFieldIOSState();
}

class _TextFieldIOSState extends State<MyTextFieldIOS> {
  bool texting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 4, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (texting)
            FadeInUp(
              from: 15,
              duration: const Duration(milliseconds: 500),
              child: Text(
                widget.textField,
                style: const TextStyle(fontSize: 10),
              ),
            )
          else
            const SizedBox(height: 12.6),
          CupertinoTextField(
            textCapitalization: TextCapitalization.sentences,
            controller: widget.controller,
            onTap: () {
              setState(() => texting = true);
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() => texting = true);
              } else {
                setState(() => texting = false);
              }
            },
            placeholder: widget.textField,
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
}

//android
abstract class MyTextFieldAndroid extends StatelessWidget {
  const MyTextFieldAndroid({
    required this.textField,
    super.key,
    this.controller,
  });
  final String textField;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: textField,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4,
          ),
          filled: true,
          fillColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
          ),
        ),
      ),
    );
  }
}
