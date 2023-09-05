import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizCompletedButton extends StatelessWidget {
  const QuizCompletedButton({super.key, required this.label, this.onPressed});

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            minimumSize: Size(115.w, 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24).r),
            backgroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.purple),
        ));
  }
}
