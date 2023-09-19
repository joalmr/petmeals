import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';

class SterillizedPetWidget extends StatefulWidget {
  const SterillizedPetWidget({super.key});

  @override
  State<SterillizedPetWidget> createState() => _SterillizedPetWidgetState();
}

class _SterillizedPetWidgetState extends State<SterillizedPetWidget> {
  bool sterillized = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Text(
            "Esterilizado",
            style: TextStyle(color: textoColor),
          ),
          const SizedBox(width: 110),
          CupertinoSwitch(
              activeColor: primerColor,
              value: sterillized,
              onChanged: (value) {
                setState(() {
                  sterillized = !sterillized;
                });
              }),
        ],
      ),
    );
  }
}
