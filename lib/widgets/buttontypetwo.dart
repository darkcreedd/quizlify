import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTypeTwo extends StatelessWidget {
  const ButtonTypeTwo({
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
            fixedSize: Size(318.w, 55.h),
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
