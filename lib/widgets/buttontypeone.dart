import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTypeOne extends StatelessWidget {
  const ButtonTypeOne({
    super.key,
    required this.title,
    this.onPressed,
    this.fontSize = 25,
  });
  final String title;
  final double fontSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            visualDensity: VisualDensity.compact,
            backgroundColor: Colors.white,
            fixedSize: Size(205.w, 54.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.r))),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.purple,
              fontSize: fontSize.sp,
              fontFamily: "Poppins"),
        ));
  }
}
