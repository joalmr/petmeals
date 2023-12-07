import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:petmeals/config/components/widgets/styles/style.button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:provider/provider.dart';
// import 'package:petmeals/setup.get_it.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({super.key});

  static const String text = 'Ingresar con Google';
  static const String imagenStr = 'assets/logo/google.jpg';

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
              MyStorage().uid = value.uid;
              MyStorage().name = value.displayName.toString().split(' ')[0];
              MyStorage().photo = value.photoURL!;

              context.go('/home');
            }
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
