import 'package:comfypet/app/user/data/local/users_list.dart';
import 'package:flutter/material.dart';

class SaludoWidget extends StatelessWidget {
  const SaludoWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                "${usersTest.first.name!} 👋",
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
                    image: AssetImage(usersTest.first.photo!),
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
