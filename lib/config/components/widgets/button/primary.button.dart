import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends BtnIOS {
  const ButtonPrimary({
    super.key,
    super.onPressed,
    required super.child,
    super.color,
  });
  // @override
  // Widget build(BuildContext context) {
  //   return Platform.isIOS
  //       ? _BtnIOS(text: text, onPressed: onPressed)
  //       : _BtnAndroid(onPressed: onPressed, text: text);
  // }
}

//ios
abstract class BtnIOS extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color color;

  const BtnIOS({
    super.key,
    this.onPressed,
    required this.child,
    this.color = primerColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      pressedOpacity: 0.8,
      child: child,
    );
  }
}

//android
abstract class BtnAndroid extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color color;

  const BtnAndroid({
    super.key,
    this.onPressed,
    required this.child,
    this.color = primerColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
