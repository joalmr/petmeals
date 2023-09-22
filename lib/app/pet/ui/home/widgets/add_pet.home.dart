import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddPetWidget extends StatelessWidget {
  const AddPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        Navigator.pushNamed(context, "/add");
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Container(
          height: 52,
          width: 52,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: fondoColor,
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/icons/apps.svg",
              height: 32,
              width: 32,
            ),
          ),
        ),
      ),
    );
  }
}
