import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DifficultyTab extends StatelessWidget {
  const DifficultyTab({super.key, required this.label, this.onPressed});
  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        width: 202.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(31.r),
                bottomRight: Radius.circular(31.r))),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 28.sp, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
