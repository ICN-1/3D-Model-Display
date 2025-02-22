import 'package:flutter/widgets.dart';
import 'package:three_dimensional_display/utils/constants/app_colors.dart';

class AppButtton extends StatelessWidget {
  const AppButtton({
    super.key,
    this.buttonText,
    this.borderColor,
    this.backgroundColor,
    this.onPressed,
    this.textColor, 
    this.width,
    this.height,
    this.fontSize,
  });

  final String? buttonText;
  final double? width, height, fontSize;
  final Color? textColor, borderColor, backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: borderColor ?? AppColors.pink, width: 3.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(height ?? 10.0),
          child: Center(
            child: Text(
              buttonText ?? "Save",
              style: TextStyle(
                fontSize: fontSize ?? 22.0,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
