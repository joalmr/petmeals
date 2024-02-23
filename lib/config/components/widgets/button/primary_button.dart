import 'dart:io';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/platform_app.dart';

// typedef PlatformApp = String;

class ButtonPrimary extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Widget child;
  final PlatformApp platformApp;
  const ButtonPrimary({
    super.key,
    this.onPressed,
    required this.child,
    this.color = kPrimaryColor,
    required this.platformApp,
  });

  Widget android() => _BtnAndroid(
        onPressed: onPressed,
        color: color,
        child: child,
      );

  Widget ios() => _BtnIOS(
        onPressed: onPressed,
        color: color,
        child: child,
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
  final Widget child;
  final void Function()? onPressed;
  final Color color;

  const _BtnIOS({
    this.onPressed,
    required this.child,
    this.color = kPrimaryColor,
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
class _BtnAndroid extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color color;

  const _BtnAndroid({
    this.onPressed,
    required this.child,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        // foregroundColor: const MaterialStatePropertyAll(Colors.black),
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
