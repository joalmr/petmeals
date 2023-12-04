import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';

class MyTextField extends StatelessWidget {
  final String textField;
  final TextEditingController? controller;
  final PlatformApp platformApp;

  const MyTextField({
    super.key,
    required this.textField,
    this.controller,
    required this.platformApp,
  });

  @override
  Widget build(BuildContext context) {
    switch (platformApp) {
      case PlatformApp.IOS:
        return _MyTextFieldIOS(
          textField: textField,
          controller: controller,
        );
      case PlatformApp.ANDROID:
        return _MyTextFieldAndroid(
          textField: textField,
          controller: controller,
        );
      // case PlatformApp.auto:
      default:
        return Platform.isIOS
            ? _MyTextFieldIOS(
                textField: textField,
                controller: controller,
              )
            : _MyTextFieldAndroid(
                textField: textField,
                controller: controller,
              );
    }
  }
}

//ios
class _MyTextFieldIOS extends StatefulWidget {
  final String textField;
  final TextEditingController? controller;

  const _MyTextFieldIOS({
    required this.textField,
    this.controller,
  });

  @override
  State<_MyTextFieldIOS> createState() => _TextFieldIOSState();
}

class _TextFieldIOSState extends State<_MyTextFieldIOS> {
  bool texting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 0, left: 4, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          texting
              ? FadeInUp(
                  from: 15,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    widget.textField,
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              : const SizedBox(height: 12.6),
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
class _MyTextFieldAndroid extends StatelessWidget {
  final String textField;
  final TextEditingController? controller;
  const _MyTextFieldAndroid({
    required this.textField,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
          ),
        ),
      ),
    );
  }
}
