import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaludoWidget extends StatelessWidget {
  const SaludoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Hola",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: .5),
              Text(
                "${userProvider.user!.name} 👋",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
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
                onTap: () {},
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image: AssetImage(userProvider.user!.photo!),
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
