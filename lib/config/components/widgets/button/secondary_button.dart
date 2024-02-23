import 'dart:io';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/platform_app.dart';

class ButtonSecondary extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final PlatformApp platformApp;
  const ButtonSecondary({
    super.key,
    this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
    required this.platformApp,
  });

  Widget android() => _BtnAndroid(
        onPressed: onPressed,
        color: color,
        text: text,
      );

  Widget ios() => _BtnIOS(
        onPressed: onPressed,
        color: color,
        text: text,
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
class _BtnIOS extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;

  const _BtnIOS({
    this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
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
    this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
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
        textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
