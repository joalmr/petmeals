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
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: widget.onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Icon(
                !widget.sex ? Icons.female : Icons.male,
                color: widget.active
                    ? kPrimaryColor
                    : kTextColor.withOpacity(0.35),
              ),
              Text(
                !widget.sex ? 'Hembra' : 'Macho',
                style: TextStyle(
                  color: widget.active
                      ? kPrimaryColor
                      : kTextColor.withOpacity(0.35),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
