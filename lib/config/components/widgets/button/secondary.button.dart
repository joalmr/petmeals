import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends BtnIOS {
  const ButtonSecondary({
    super.key,
    super.onPressed,
    required super.text,
    super.color,
  });
}

//ios
abstract class BtnIOS extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const BtnIOS({
    super.key,
    this.onPressed,
    required this.text,
    this.color = primerColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      // pressedOpacity: 0.8,
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}

//android
abstract class BtnAndroid extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  const BtnAndroid({
    super.key,
    this.onPressed,
    required this.text,
    this.color = primerColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(color),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
