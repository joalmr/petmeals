import 'package:petmeals/src/core/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonAlternative extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const ButtonAlternative({
    super.key,
    this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
  });

  Widget android() => SizedBox(
        width: double.maxFinite,
        child: _BtnAndroid(
          onPressed: onPressed,
          color: color,
          text: text,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return android();
  }
}

class _BtnAndroid extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  const _BtnAndroid({
    this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(color),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
