import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlify/pages/signin_page.dart';
import 'package:quizlify/widgets/buttontypetwo.dart';
import 'package:quizlify/widgets/ctextfieldandlabel.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: mediaQ.height,
            width: mediaQ.width,
            decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage("assets/images/question_markIII.png"),
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
                  "Sign Up",
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
                  label: "Email",
                  hint: "Enter your Email",
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CTextFieldAndLabel(
                  label: "Password",
                  hint: "Create password",
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CTextFieldAndLabel(
                  label: "Confirm Password",
                  hint: "Confirm password",
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
                  title: "Sign up",
                  onPressed: () {},
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
                              builder: (context) => const SignInScreen(),
                            ));
                      },
                      child: const Text(
                        "Already have an account? Sign in",
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
