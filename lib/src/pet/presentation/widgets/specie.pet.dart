import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpeciePetWidget extends StatefulWidget {
  const SpeciePetWidget({
    super.key,
    required this.specie,
    this.onPressed,
    required this.active,
  });
  final int specie;
  final bool active;
  final void Function()? onPressed;

  @override
  State<SpeciePetWidget> createState() => _SpeciePetWidgetState();
}

class _SpeciePetWidgetState extends State<SpeciePetWidget> {
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
              SvgPicture.asset(
                widget.specie == 0
                    ? 'assets/images/icons/cat.svg'
                    : 'assets/images/icons/dog.svg',
                colorFilter: ColorFilter.mode(
                    widget.active
                        ? kPrimaryColor
                        : kTextColor.withOpacity(0.35),
                    BlendMode.srcIn),
                height: 32,
              ),
              Text(
                widget.specie == 0 ? 'Gato' : 'Perro',
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
