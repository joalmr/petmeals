import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PicturePet extends StatelessWidget {
  final double aspectRatio;
  final String? imageStr;
  final Widget? buttonLeft;
  final Widget? buttonRight;

  const PicturePet({
    super.key,
    required this.aspectRatio,
    required this.imageStr,
    required this.buttonLeft,
    this.buttonRight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 175,
          width: double.maxFinite,
          color: Colors.black.withOpacity(0.15),
        ),
        Container(
          height: 220,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: imageStr == null
                    ? const Image(
                        image: AssetImage('assets/images/perro.jpg'),
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: imageStr!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
        buttonLeft == null ? const SizedBox() : buttonLeft!,
        buttonRight == null ? const SizedBox() : buttonRight!,
      ],
    );
  }
}
