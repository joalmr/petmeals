import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class SexPetWidget extends StatefulWidget {
  const SexPetWidget({
    super.key,
    required this.sex,
    this.onPressed,
    required this.active,
  });
  final bool sex;
  final bool active;
  final void Function()? onPressed;

  @override
  State<SexPetWidget> createState() => _SexPetWidgetState();
}

class _SexPetWidgetState extends State<SexPetWidget> {
  @override
  Widget build(BuildContext context) {
    return ButtonPrimary(
      platformApp: Global.platformApp,
      color: Colors.white,
      onPressed: widget.onPressed,
      child: Column(
        children: [
          Icon(
            !widget.sex ? Icons.female : Icons.male,
            color: widget.active ? kPrimaryColor : kTextColorContrast,
          ),
          Text(
            !widget.sex ? 'Hembra' : 'Macho',
            style: TextStyle(
              color: widget.active ? kPrimaryColor : kTextColorContrast,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
