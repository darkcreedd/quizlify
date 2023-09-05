import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/pages/select_difficulty_page.dart';
import 'package:quizlify/widgets/quizcompletedbutton.dart';

class QuizCompletedWidget extends StatelessWidget {
  const QuizCompletedWidget(
      {super.key,
      required this.remark,
      required this.accumulatedScore,
      required this.score});
  final String remark;
  final int score;
  final int accumulatedScore;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          color: Colors.transparent,
          height: 700.h,
          width: 343.w,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 568.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Container(
                margin: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "QUIZ",
                      style: TextStyle(
                          fontSize: 50.sp,
                          fontFamily: "Poppins-Black",
                          color: Colors.white),
                    ),
                    Text(
                      "Complete",
                      style: TextStyle(
                          fontFamily: "Poppins-Black",
                          fontSize: 40.sp,
                          color: Colors.white),
                    ),
                    Text(
                      remark,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: Colors.white),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          score.toString(),
                          style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          "/10",
                          style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Accumulated Score:",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          accumulatedScore.toString(),
                          style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuizCompletedButton(
                          label: "Continue",
                          onPressed: () {
                            var quizLogic =
                                Provider.of<QuizLogic>(context, listen: false);
                            quizLogic.scoreM = 0;
                            quizLogic.scoreTF = 0;
                            quizLogic.questions = quizLogic.fetchQuiz();
                            quizLogic.refresh();
                          },
                        ),
                        QuizCompletedButton(
                          label: "End current session",
                          onPressed: () {
                            var quizLogic =
                                Provider.of<QuizLogic>(context, listen: false);
                            quizLogic.scoreM = 0;
                            quizLogic.totalScoreM = 0;
                            quizLogic.totalScoreTF = 0;
                            quizLogic.scoreTF = 0;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectDifficultyPage(),
                                ));
                          },
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
        Positioned(
          bottom: 510.h,
          left: 110.w,
          child: CircleAvatar(
            radius: 55.w,
            backgroundImage:
                const AssetImage("assets/images/albert-einstein-cartoon.jpg"),
          ),
        )
      ],
    );
  }
}
