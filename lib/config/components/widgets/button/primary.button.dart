import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends BtnIOS {
  const ButtonPrimary({
    required super.child,
    super.key,
    super.onPressed,
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
  const BtnIOS({
    required this.child,
    super.key,
    this.onPressed,
    this.color = primerColor,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color color;

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
  const BtnAndroid({
    required this.child,
    super.key,
    this.onPressed,
    this.color = primerColor,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color color;

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
