import 'dart:io';

import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/button/platform_app.dart';

class ButtonSecondary extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final PlatformApp platformApp;
  const ButtonSecondary({
    super.key,
    this.onPressed,
    required this.text,
    this.color = primerColor,
    required this.platformApp,
  });

  @override
  Widget build(BuildContext context) {
    switch (platformApp) {
      case PlatformApp.ios:
        return _BtnIOS(
          onPressed: onPressed,
          color: color,
          text: text,
        );
      case PlatformApp.android:
        return _BtnAndroid(
          onPressed: onPressed,
          color: color,
          text: text,
        );
      // case PlatformApp.auto:
      //   return Platform.isIOS
      //       ? _BtnIOS(
      //           onPressed: onPressed,
      //           color: color,
      //           text: text,
      //         )
      //       : _BtnAndroid(
      //           onPressed: onPressed,
      //           color: color,
      //           text: text,
      //         );
      default:
        return Platform.isIOS
            ? _BtnIOS(
                onPressed: onPressed,
                color: color,
                text: text,
              )
            : _BtnAndroid(
                onPressed: onPressed,
                color: color,
                text: text,
              );
    }
  }
}

//ios
class _BtnIOS extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const _BtnIOS({
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
class _BtnAndroid extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  const _BtnAndroid({
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
