import 'package:flutter_svg/svg.dart';
import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({super.key});

  static const String text = 'Acceder con Google';

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return SizedBox(
      width: double.maxFinite,
      height: 46,
      // margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: () async {
          userProvider.signInGoogle().then((value) {
            if (value != null) {
              context.go('/home');
            }
          });
        },
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xFFffffff),
          foregroundColor: const Color(0xFF1f1f1f),
          disabledBackgroundColor: const Color(0xFF1f1f1f).withOpacity(0.45),
          disabledForegroundColor: const Color(0xFF1f1f1f).withOpacity(0.38),
          side: const BorderSide(color: Color(0xFF747775)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icons/google.svg',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            const Text(text),
          ],
        ),
      ),
    );
  }
}
