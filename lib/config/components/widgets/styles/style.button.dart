import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';

final BorderRadius _borderRadiusBtn = BorderRadius.circular(5);

final ButtonStyle buttonStylePrimary = TextButton.styleFrom(
  alignment: Alignment.center,
  backgroundColor: primerColor,
  foregroundColor: Colors.grey[350],
  disabledBackgroundColor: primerColor.withOpacity(0.45),
  disabledForegroundColor: Colors.grey[350],
  side: BorderSide(color: primerColor.withOpacity(0.95)),
  shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
);

final ButtonStyle buttonStyleSecondary = TextButton.styleFrom(
  alignment: Alignment.center,
  foregroundColor: segundoColor,
  side: const BorderSide(color: segundoColor),
  shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
);

ButtonStyle buttonStyleOther(Color color, Color? textColor) {
  return TextButton.styleFrom(
    alignment: Alignment.center,
    backgroundColor: color,
    foregroundColor: textColor ?? Colors.black54,
    disabledBackgroundColor: color.withOpacity(0.45),
    disabledForegroundColor:
        textColor != null ? textColor.withOpacity(0.38) : Colors.black38,
    side: const BorderSide(color: Color(0xFFedede9)),
    shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
  );
}

ButtonStyle buttonStyleIcon(Color color) {
  return TextButton.styleFrom(
    alignment: Alignment.center,
    backgroundColor: color,
    foregroundColor: Colors.black54,
    disabledBackgroundColor: color.withOpacity(0.45),
    disabledForegroundColor: Colors.black38,
    side: BorderSide(color: color.withOpacity(0.95)),
    shape: RoundedRectangleBorder(borderRadius: _borderRadiusBtn),
  );
}
