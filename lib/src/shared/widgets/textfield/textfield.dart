import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String textField;
  final TextEditingController? controller;
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
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.enabled,
    this.onTap,
    this.readOnly = false,
  });

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
    return android();
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
            horizontal: 16,
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
