import 'package:flutter/material.dart';
import 'package:flutter_pvfoodservice/utils/dimensions.dart';
import 'package:flutter_pvfoodservice/widgets/small_text.dart';

class HourAndText extends StatelessWidget {
  final IconData icon;
  final String textHour;
  final Color color;
  final Color iconColor;
  final double iconSize;

  const HourAndText(
      {super.key,
      required this.icon,
      required this.textHour,
      this.color = const Color(0xFF332d2b),
      this.iconColor = const Color(0xFF5c524f),
      this.iconSize = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize == 0 ? Dimensions.icon24 : iconSize,
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        SmallText(
          text: textHour,
          color: color,
        )
      ],
    );
  }
}
