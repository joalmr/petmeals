import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends BtnIOS {
  const ButtonPrimary({
    super.key,
    super.onPressed,
    required super.child,
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

  const BtnIOS({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: primerColor,
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

  const BtnAndroid({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(primerColor),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
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
