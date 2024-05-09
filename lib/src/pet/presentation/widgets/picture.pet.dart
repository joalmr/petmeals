import 'package:flutter/material.dart';

class PicturePet extends StatelessWidget {
  final double aspectRatio;
  final Widget child;
  final Widget? buttonLeft;
  final Widget? buttonRight;

  const PicturePet({
    super.key,
    required this.aspectRatio,
    required this.child,
    required this.buttonLeft,
    this.buttonRight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 145,
          width: double.maxFinite,
          color: Colors.black.withOpacity(0.1),
        ),
        SizedBox(
          height: 240,
          width: double.maxFinite,
          child: child,
        ),
        buttonLeft == null
            ? const SizedBox()
            : Positioned(
                top: 16,
                left: 10,
                child: buttonLeft!,
              ),
        buttonRight == null
            ? const SizedBox()
            : Positioned(
                top: 16,
                right: 10,
                child: buttonRight!,
              ),
      ],
    );
  }
}
