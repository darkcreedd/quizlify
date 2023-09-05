import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/pages/quiztypepage.dart';
import 'package:quizlify/widgets/difficultytab.dart';
import 'package:quizlify/widgets/quizlifylogo.dart';

class SelectDifficultyPage extends StatelessWidget {
  const SelectDifficultyPage({super.key});

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
                "Hello User",
                style: TextStyle(fontSize: 50.sp, color: Colors.purple),
              ),
              SizedBox(height: 40.h),
              Text(
                "Select Difficulty",
                style: TextStyle(fontSize: 30.sp, color: Colors.purple),
              ),
              SizedBox(height: 30.h),
              DifficultyTab(
                label: "Easy",
                onPressed: () {
                  Provider.of<QuizLogic>(context, listen: false)
                      .difficultyLevel = "easy";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizTypeScreen(),
                      ));
                },
              ),
              SizedBox(height: 20.h),
              DifficultyTab(
                label: "Medium",
                onPressed: () {
                  Provider.of<QuizLogic>(context, listen: false)
                      .difficultyLevel = "medium";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizTypeScreen(),
                      ));
                },
              ),
              SizedBox(height: 20.h),
              DifficultyTab(
                label: "Hard",
                onPressed: () {
                  Provider.of<QuizLogic>(context, listen: false)
                      .difficultyLevel = "hard";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizTypeScreen(),
                    ),
                  );
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
