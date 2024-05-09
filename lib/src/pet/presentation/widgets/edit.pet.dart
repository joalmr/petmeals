import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';

class EditPetWidget extends StatelessWidget {
  const EditPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Icon(
        Icons.edit,
        color: kTextColorContrast,
      ),
      onPressed: () {
        context.push('/petdetail/update', extra: true);
      },
    );
  }
}
