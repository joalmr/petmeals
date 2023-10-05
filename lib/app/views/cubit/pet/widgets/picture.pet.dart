import 'package:flutter/material.dart';

class PicturePet extends StatelessWidget {
  const PicturePet({
    required this.aspectRatio,
    required this.child,
    required this.buttonLeft,
    super.key,
    this.buttonRight,
  });
  final double aspectRatio;
  final Widget child;
  final Widget? buttonLeft;
  final Widget? buttonRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 175,
          width: double.maxFinite,
          color: Colors.black.withOpacity(0.1),
        ),
        Container(
          height: 240,
          margin: const EdgeInsets.only(top: 18),
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: child,
              ),
            ),
          ),
        ),
        if (buttonLeft == null)
          const SizedBox()
        else
          Positioned(
            top: 32,
            left: 10,
            child: buttonLeft!,
          ),
        if (buttonRight == null)
          const SizedBox()
        else
          Positioned(
            top: 32,
            right: 10,
            child: buttonRight!,
          ),
      ],
    );
  }
}
