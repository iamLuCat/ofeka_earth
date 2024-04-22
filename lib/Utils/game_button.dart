import 'package:angola_sustentavel/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const GameButton({super.key,
    required this.text,
    this.height,
    this.width,
    this.onPressed,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white, width: 3.0),
          ),
          backgroundColor: AppColors.yellowColor,
        ),
        child: Text(
          text,
          style: textStyle ?? const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
