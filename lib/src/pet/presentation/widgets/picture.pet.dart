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
        Container(
          height: 240,
          margin: const EdgeInsets.only(top: 18),
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: child,
              ),
            ),
          ),
        ),
        buttonLeft == null
            ? const SizedBox()
            : Positioned(
                top: 32,
                left: 10,
                child: buttonLeft!,
              ),
        buttonRight == null
            ? const SizedBox()
            : Positioned(
                top: 32,
                right: 10,
                child: buttonRight!,
              ),
      ],
    );
  }
}
