import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/pages/booleantypequizpage.dart';
import 'package:quizlify/pages/multichoicequizpage.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizLogic>(context, listen: false).questions =
        Provider.of<QuizLogic>(context, listen: false).fetchQuiz();
    // Start the timer when the screen is initialized
    if (Provider.of<QuizLogic>(context, listen: false).questionType ==
        'multiple') {
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MultiTypeQuizPage()),
        );
      });
    } else if (Provider.of<QuizLogic>(context, listen: false).questionType ==
        'boolean') {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BooleanTypeQuizPage()),
        );
      });
    }
  }

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
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "QuIZLIFY",
                  style: TextStyle(
                      fontFamily: "Azonix",
                      fontSize: 30.sp,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const QuizlifyLogo(),
                SizedBox(
                  height: 30.h,
                ),
                SpinKitCircle(
                  color: Colors.white,
                  size: 48.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
