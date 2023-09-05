import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizlify/logic/quiz_logic.dart';
import 'package:quizlify/pages/getting_started.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizLogic(),
        ),
      ],
      builder: (context, child) => const MyApp(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MaterialApp(
          theme: ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Colors.purple,
              primarySwatch: Colors.blue),
          title: 'QUIZLIFY',
          debugShowCheckedModeBanner: false,
          home: const GettingStartedScreen()),
    );
  }
}
