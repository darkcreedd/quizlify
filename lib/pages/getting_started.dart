import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlify/pages/signin_page.dart';
import 'package:quizlify/pages/signup_page.dart';
import 'package:quizlify/widgets/buttontypeone.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: mediaQ.height,
          width: mediaQ.width,
          decoration: const BoxDecoration(
            color: Colors.purple,
            image: DecorationImage(
                opacity: 0.1,
                image: AssetImage("assets/images/questionmark_icon.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "QuIZLIFY",
                style: TextStyle(
                    fontFamily: "Azonix", fontSize: 35.sp, color: Colors.white),
              ),
              SizedBox(height: 30.h),
              const QuizlifyLogo(),
              SizedBox(height: 30.h),
              ButtonTypeOne(
                title: "Sign in",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              ButtonTypeOne(
                title: "Create account",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                fontSize: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
