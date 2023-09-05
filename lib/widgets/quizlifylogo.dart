import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizlifyLogo extends StatelessWidget {
  const QuizlifyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 85.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/logo-01.png",
              ),
              scale: 0.8,
              fit: BoxFit.cover)),
    );
  }
}
