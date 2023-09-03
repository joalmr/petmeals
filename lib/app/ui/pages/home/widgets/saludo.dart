import 'package:flutter/material.dart';

class SaludoHome extends StatelessWidget {
  const SaludoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // '${AppLocalizations.of(context)!.hola},',
                "Hola",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: .5),
              Text(
                // '${provider.user.name} 👋',
                "Alonso 👋",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  // color: primerColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                onTap: () {
                  // _navCubit.navPush(ProfileUserView(
                  //   profile: context.read<HomeCubit>().profile,
                  // ));
                  //TODO
                },
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image: AssetImage("assets/images/me.png"),
                    height: 48,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
