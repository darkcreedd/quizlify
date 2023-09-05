import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextFieldAndLabel extends StatelessWidget {
  const CTextFieldAndLabel(
      {super.key, required this.label, required this.hint});
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      width: 370.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.r),
        color: Colors.white.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            Expanded(
              child: SizedBox(
                width: 327.w,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: hint,
                      contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 8).w,
                      hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white.withOpacity(0.6)),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
