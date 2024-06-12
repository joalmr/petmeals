import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Widget child;

  const ButtonPrimary({
    super.key,
    this.onPressed,
    required this.child,
    this.color = kPrimaryColor,
  });

  Widget android() => SizedBox(
        width: double.maxFinite,
        child: _BtnAndroid(
          onPressed: onPressed,
          color: color,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return android();
  }
}

//ios
// class _BtnIOS extends StatelessWidget {
//   final Widget child;
//   final void Function()? onPressed;
//   final Color color;

//   const _BtnIOS({
//     this.onPressed,
//     required this.child,
//     this.color = kPrimaryColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       color: color,
//       onPressed: onPressed,
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
//       borderRadius: const BorderRadius.all(Radius.circular(20)),
//       pressedOpacity: 0.8,
//       child: child,
//     );
//   }
// }

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
        backgroundColor: WidgetStatePropertyAll(color),
        foregroundColor: const WidgetStatePropertyAll(kTextColorContrast),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
