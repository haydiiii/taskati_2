import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class custom_elev_button extends StatelessWidget {
  const custom_elev_button({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    this.height,
  });
  final Function() onPressed;
  final String text;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: Text(
          text,
          style: getBodyStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
