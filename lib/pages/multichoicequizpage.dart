import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/widgets/choicestab.dart';
import 'package:html/parser.dart' show parse;
import 'package:quizlify/widgets/quizcompletedwidget.dart';
import 'package:quizlify/widgets/quizloadingwidget.dart';

class MultiTypeQuizPage extends StatefulWidget {
  const MultiTypeQuizPage({Key? key}) : super(key: key);

  @override
  State<MultiTypeQuizPage> createState() => _MultiTypeQuizPageState();
}

class _MultiTypeQuizPageState extends State<MultiTypeQuizPage> {
  @override
  void initState() {
    super.initState();
  }

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Colors.purple,
          width: mediaQ.width * 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple[200]),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.jpg"),
                ),
                accountName: const Text("Laura Palmer"),
                accountEmail: const Text('laurapalmer@quizlify.com'),
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    const ImageIcon(
                      AssetImage("assets/images/settings_icon.png"),
                      color: Colors.white,
                      size: 100,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: mediaQ.height,
          width: mediaQ.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgroundM.png"),
                fit: BoxFit.cover),
          ),
          child: Consumer<QuizLogic>(
            builder: (context, dataQ, child) => Column(
              children: [
                FutureBuilder(
                  future: dataQ.questions,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const QuizLoadingWidget();

                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          return CarouselSlider.builder(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              height: 700.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              pageSnapping: true,
                              disableCenter: true,
                              onPageChanged: (index, reason) {
                                if (index < dataQ.currentPage) {
                                  _carouselController.animateToPage(index + 1);
                                } else {
                                  dataQ.currentPage = index;
                                }
                                Provider.of<QuizLogic>(context, listen: false)
                                    .resetButtonColorsM();
                              },
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemCount: snapshot.data!.length + 1,
                            itemBuilder: (context, index, realIndex) {
                              if (index == snapshot.data!.length) {
                                // Render a "Finish" screen or any other content
                                return Consumer<QuizLogic>(
                                    builder: (context, value, child) =>
                                        QuizCompletedWidget(
                                          score: value.scoreM,
                                          remark: value.remarkM,
                                          accumulatedScore: value.totalScoreM,
                                        ));
                              }

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
                                        borderRadius:
                                            BorderRadius.circular(48.r),
                                      ),
                                      child: Consumer<QuizLogic>(
                                        builder: (context, quizLogic, child) =>
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20.w, 80.h, 20.w, 20.h),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      (index + 1).toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          ListView(children: [
                                                        Text(
                                                          parse(snapshot
                                                                  .data![index]
                                                                  .question)
                                                              .documentElement!
                                                              .text,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.sp),
                                                        ),
                                                      ]),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    ChoicesTab(
                                                      text: parse(snapshot
                                                              .data![index]
                                                              .options[0])
                                                          .documentElement!
                                                          .text,
                                                      textColor: quizLogic
                                                          .textColorsM[0],
                                                      onPressed: () {
                                                        Provider.of<QuizLogic>(context,
                                                                listen: false)
                                                            .isCorrectM(
                                                                option1: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[0],
                                                                option2: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[1],
                                                                option3: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[2],
                                                                option4: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[3],
                                                                isClickedOption:
                                                                    0,
                                                                correctOption: snapshot
                                                                    .data![index]
                                                                    .correctAnswer);
                                                        // }
                                                      },
                                                      buttonColor: quizLogic
                                                          .buttonColorsM[0],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    ChoicesTab(
                                                      textColor: quizLogic
                                                          .textColorsM[1],
                                                      text: parse(snapshot
                                                              .data![index]
                                                              .options[1])
                                                          .documentElement!
                                                          .text,
                                                      buttonColor: quizLogic
                                                          .buttonColorsM[1],
                                                      onPressed: () {
                                                        if (snapshot
                                                                .data![index]
                                                                .options
                                                                .length >
                                                            3) {
                                                          Provider.of<QuizLogic>(context, listen: false).isCorrectM(
                                                              option1: snapshot
                                                                  .data![index]
                                                                  .options[0],
                                                              option2: snapshot
                                                                  .data![index]
                                                                  .options[1],
                                                              option3: snapshot
                                                                  .data![index]
                                                                  .options[2],
                                                              option4: snapshot
                                                                  .data![index]
                                                                  .options[3],
                                                              isClickedOption:
                                                                  1,
                                                              correctOption:
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .correctAnswer);
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    ChoicesTab(
                                                      textColor: quizLogic
                                                          .textColorsM[2],
                                                      text: parse(snapshot
                                                              .data![index]
                                                              .options[2])
                                                          .documentElement!
                                                          .text,
                                                      buttonColor: quizLogic
                                                          .buttonColorsM[2],
                                                      onPressed: () {
                                                        Provider.of<QuizLogic>(context,
                                                                listen: false)
                                                            .isCorrectM(
                                                                option1: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[0],
                                                                option2: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[1],
                                                                option3: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[2],
                                                                option4: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[3],
                                                                isClickedOption:
                                                                    2,
                                                                correctOption: snapshot
                                                                    .data![index]
                                                                    .correctAnswer);
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    ChoicesTab(
                                                      textColor: quizLogic
                                                          .textColorsM[3],
                                                      text: parse(snapshot
                                                              .data![index]
                                                              .options[3])
                                                          .documentElement!
                                                          .text,
                                                      buttonColor: quizLogic
                                                          .buttonColorsM[3],
                                                      onPressed: () {
                                                        Provider.of<QuizLogic>(context,
                                                                listen: false)
                                                            .isCorrectM(
                                                                option1: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[0],
                                                                option2: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[1],
                                                                option3: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[2],
                                                                option4: snapshot
                                                                    .data![
                                                                        index]
                                                                    .options[3],
                                                                isClickedOption:
                                                                    3,
                                                                correctOption: snapshot
                                                                    .data![index]
                                                                    .correctAnswer);
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      snapshot.data![index]
                                                          .category,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      quizLogic
                                                          .difficultyLevel!,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                    ),
                                                  ],
                                                )),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 510.h,
                                    left: 110.w,
                                    child: CircleAvatar(
                                      radius: 55.w,
                                      backgroundImage: const AssetImage(
                                          "assets/images/albert-einstein-cartoon.jpg"),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        }
                        break;
                      default:
                        return const Text("No data received");
                    }
                    return const Text("No data received");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoReverseScrollPhysics extends ScrollPhysics {
  const NoReverseScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  NoReverseScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoReverseScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return position.atEdge || super.shouldAcceptUserOffset(position);
  }
}
