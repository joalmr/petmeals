import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:comfypet/config/components/widgets/styles/style.button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({super.key});

  static const String text = 'Ingresar con Google';
  static const String imagenStr = 'assets/logo/google.jpg';

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Container(
      width: double.maxFinite,
      height: 46,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: () async {
          userProvider.signInGoogle(context).then((value) {
            if (value) Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
          });
        },
        style: buttonStyleOther(Colors.white, Colors.black38),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image(
                image: AssetImage(imagenStr),
                fit: BoxFit.scaleDown,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(width: 4),
            Text(text),
          ],
        ),
      ),
    );
  }
}
