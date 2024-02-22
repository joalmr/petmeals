import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';

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
    return ButtonPrimary(
      platformApp: Global.platformApp,
      color: Colors.white,
      onPressed: widget.onPressed,
      child: Column(
        children: [
          SvgPicture.asset(
            widget.specie == 0
                ? 'assets/images/icons/cat.svg'
                : 'assets/images/icons/dog.svg',
            colorFilter: ColorFilter.mode(
                widget.active ? kPrimaryColor : kTextColorContrast,
                BlendMode.srcIn),
            height: 32,
          ),
          Text(
            widget.specie == 0 ? 'Gato' : 'Perro',
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
