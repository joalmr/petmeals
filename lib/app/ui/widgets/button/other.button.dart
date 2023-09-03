import 'package:flutter/material.dart';

import 'style.button.dart';

class ButtonOtherImg extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String imagenStr;
  final Color color;
  final Color? textColor;

  const ButtonOtherImg({
    super.key,
    this.onPressed,
    required this.text,
    required this.imagenStr,
    required this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 46,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: onPressed,
        style: buttonStyleOther(color, textColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image(
                image: AssetImage(imagenStr),
                fit: BoxFit.scaleDown,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 4),
            Text(text),
          ],
        ),
      ),
    );
  }
}
