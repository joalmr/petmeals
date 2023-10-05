import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends BtnIOS {
  const ButtonSecondary({
    required super.text,
    super.key,
    super.onPressed,
  });
}

//ios
abstract class BtnIOS extends StatelessWidget {
  const BtnIOS({
    required this.text,
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      // pressedOpacity: 0.8,
      child: Text(
        text,
        style: const TextStyle(color: primerColor),
      ),
    );
  }
}

//android
abstract class BtnAndroid extends StatelessWidget {
  const BtnAndroid({
    required this.text,
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(primerColor),
        shape: MaterialStatePropertyAll(
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
