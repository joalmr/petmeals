import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPetWidget extends StatelessWidget {
  const AddPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        context.push('/add', extra: false);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Container(
          height: 52,
          width: 52,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: kPrimaryColor,
          ),
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Icon(
              Icons.add_rounded,
              size: 32,
              color: kTextColorContrast,
            ),
          ),
        ),
      ),
    );
  }
}
