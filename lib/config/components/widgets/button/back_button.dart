import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/config/styles/colors/colors.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      icon: Icon(
        Icons.arrow_back_rounded,
        color: color ?? kTextColorContrast,
      ),
      onPressed: () => context.pop(),
    );
  }
}
