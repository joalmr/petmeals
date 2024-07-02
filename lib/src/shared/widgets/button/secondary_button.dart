import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Widget child;

  const ButtonSecondary({
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
    return OutlinedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(color),
        overlayColor: WidgetStatePropertyAll(color.withOpacity(0.05)),
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
