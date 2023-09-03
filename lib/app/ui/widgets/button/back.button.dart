import 'package:comfypet/src/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class BackButtonPosition extends StatelessWidget {
  const BackButtonPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 44,
      left: 10,
      child: BackButton(),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(7.5)),
      onTap: () {
        Navigator.pop(context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
        child: Container(
          color: fondoColor.withOpacity(0.75),
          height: 40,
          width: 60,
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
    );
  }
}
