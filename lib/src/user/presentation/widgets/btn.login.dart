import 'package:flutter_svg/svg.dart';
import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:petmeals/config/components/widgets/styles/style.button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({super.key});

  static const String text = 'Acceder con Google';

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return Container(
      width: double.maxFinite,
      height: 46,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: () async {
          userProvider.signInGoogle().then((value) {
            if (value != null) {
              context.go('/home');
            }
          });
        },
        style: buttonStyleOther(
          const Color(0xffFFFFFF),
          const Color(0xff1f1f1f),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: SvgPicture.asset(
                'assets/images/icons/google.svg',
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 4),
            const Text(text),
          ],
        ),
      ),
    );
  }
}
