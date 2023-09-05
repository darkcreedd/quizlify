import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/pages/onboardingpage.dart';
import 'package:quizlify/widgets/difficultytab.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class QuizTypeScreen extends StatelessWidget {
  const QuizTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: mediaQ.height,
          width: mediaQ.width,
          decoration: BoxDecoration(
            color: Colors.purple.withAlpha(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.purple, shape: BoxShape.circle),
                  child: const QuizlifyLogo()),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Quiz Type",
                style: TextStyle(fontSize: 30.sp, color: Colors.purple),
              ),
              SizedBox(height: 30.h),
              DifficultyTab(
                label: "Multi-Choice",
                onPressed: () {
                  Provider.of<QuizLogic>(context, listen: false).questionType =
                      "multiple";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ));
                },
              ),
              SizedBox(height: 20.h),
              DifficultyTab(
                label: "True/False",
                onPressed: () {
                  Provider.of<QuizLogic>(context, listen: false).questionType =
                      "boolean";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ));
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
