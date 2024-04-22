import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class OfekaCircleButton extends StatelessWidget {
  final Widget icon;
  final double? size;
  final VoidCallback? onPressed;

  const OfekaCircleButton({super.key,
    required this.icon,
    this.size,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 50,
      width: size ?? 50,
      child: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.yellowColor,
            border: Border.all(
              color: Colors.white,
              width: 2.0
            )
          ),
          child: icon,
        ),
      ),
    );
  }
}
