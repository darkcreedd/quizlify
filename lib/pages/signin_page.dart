import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlify/pages/select_difficulty_page.dart';
import 'package:quizlify/pages/signup_page.dart';
import 'package:quizlify/widgets/buttontypetwo.dart';
import 'package:quizlify/widgets/ctextfieldandlabel.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: mediaQ.height,
            width: mediaQ.width,
            decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage("assets/images/ question_mark.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const QuizlifyLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30.sp, color: Colors.white),
                ),
                SizedBox(height: 30.h),
                const CTextFieldAndLabel(
                  label: "Username",
                  hint: "Enter your username",
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CTextFieldAndLabel(
                  label: "Password",
                  hint: "Enter Password",
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ButtonTypeTwo(
                  title: "Sign in",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectDifficultyPage(),
                        ));
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        "New here? Create account",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
