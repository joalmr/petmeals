import 'package:flutter/material.dart';

import '../styles/style.button.dart';

class ButtonSecondary extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData? icon;

  const ButtonSecondary({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 46,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: onPressed,
        style: buttonStyleSecondary,
        child: icon == null
            ? Text(text!)
            : text == null
                ? Icon(icon)
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(icon),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(text!),
                      ),
                    ],
                  ),
      ),
    );
  }
}
