import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChoicesTab extends StatelessWidget {
//   const ChoicesTab({Key? key, required this.text}) : super(key: key);
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         minimumSize: Size(241.w, 35.h),
//       ),
//       onPressed: () {},
//       child: FittedBox(
//         child: Text(
//           text,
//           style: TextStyle(color: Colors.purple, fontSize: 20.sp),
//         ),
//       ),
//     );
//   }
// }

class ChoicesTab extends StatelessWidget {
  const ChoicesTab(
      {Key? key,
      required this.text,
      this.buttonColor,
      this.onPressed,
      this.textColor})
      : super(key: key);

  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: buttonColor ?? Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(241.w, 35),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 20.sp),
        ),
      ),
    );
  }
}
