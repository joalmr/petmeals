import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';

class SterillizedPetWidget extends StatefulWidget {
  const SterillizedPetWidget({
    super.key,
    required this.sterillized,
    this.onChanged,
  });
  final bool sterillized;
  final void Function(bool)? onChanged;

  @override
  State<SterillizedPetWidget> createState() => _SterillizedPetWidgetState();
}

class _SterillizedPetWidgetState extends State<SterillizedPetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Text(
            'Esterilizado',
            style: TextStyle(color: kTextColor),
          ),
          const SizedBox(width: 110),
          CupertinoSwitch(
            activeColor: kPrimaryColor,
            value: widget.sterillized,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
