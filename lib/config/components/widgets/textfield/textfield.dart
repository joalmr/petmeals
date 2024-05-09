import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';

class MyTextField extends StatelessWidget {
  final String textField;
  final TextEditingController? controller;
  final PlatformApp? platformApp;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final bool? enabled;
  final void Function()? onTap;
  final bool? readOnly;

  const MyTextField({
    super.key,
    required this.textField,
    this.controller,
    this.platformApp = PlatformApp.ANDROID,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.enabled,
    this.onTap,
    this.readOnly = false,
  });

  Widget ios() => _MyTextFieldIOS(
        textField: textField,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        textCapitalization: textCapitalization!,
        enabled: enabled,
        onTap: onTap,
        readOnly: readOnly!,
      );

  Widget android() => _MyTextFieldAndroid(
        textField: textField,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        textCapitalization: textCapitalization!,
        enabled: enabled,
        onTap: onTap,
        readOnly: readOnly!,
      );

  @override
  Widget build(BuildContext context) {
    switch (platformApp) {
      case PlatformApp.IOS:
        return ios();
      case PlatformApp.ANDROID:
        return android();
      case PlatformApp.AUTO:
      default:
        return Platform.isIOS ? ios() : android();
    }
  }
}

//ios
class _MyTextFieldIOS extends StatefulWidget {
  final String textField;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final bool? enabled;
  final void Function()? onTap;
  final bool readOnly;

  const _MyTextFieldIOS({
    required this.textField,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    required this.textCapitalization,
    this.enabled,
    this.onTap,
    required this.readOnly,
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
          texting || widget.onTap != null
              ? FadeInUp(
                  from: 15,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    widget.textField,
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              : const SizedBox(height: 12.6),
          // CupertinoTextFormFieldRow()
          CupertinoTextFormFieldRow(
            padding: const EdgeInsets.all(0),
            validator: widget.validator,
            controller: widget.controller,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            onTap: widget.onTap ??
                () {
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
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final bool? enabled;
  final void Function()? onTap;
  final bool readOnly;

  const _MyTextFieldAndroid({
    required this.textField,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    required this.textCapitalization,
    this.enabled,
    this.onTap,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        enabled: enabled,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: textField,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 8,
          ),
          // filled: true,
          // fillColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(style: BorderStyle.solid, width: 1),
          ),
        ),
      ),
    );
  }
}
