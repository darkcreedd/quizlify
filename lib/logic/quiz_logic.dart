import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizlify/data/models/custom_quiz.dart';
import 'package:quizlify/data/models/quiz.dart';
import 'package:http/http.dart' as http;

class QuizLogic extends ChangeNotifier {
  Future<List<QuizQuestion>>? questions;

  String questionType = "multiple";
  int currentPage = 0;
  int index = 0;
  refresh() {
    currentPage = 0;
    index = 0;
    notifyListeners();
  }

  String? difficultyLevel;
  Future<List<QuizQuestion>>? fetchQuiz() async {
    List<QuizQuestion> questions = [];
    int i = 0;

    try {
      Uri uri = Uri.parse(
          "https://opentdb.com/api.php?amount=10&difficulty=$difficultyLevel&type=$questionType");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        notifyListeners();
        Quiz apiResponse = quizFromJson(response.body);
        int i = 0;
        for (var result in apiResponse.results) {
          QuizQuestion quizQuestion = QuizQuestion(
            id: i,
            category: result.category,
            question: result.question,
            options: _randomizeOptions(
                result.correctAnswer, result.incorrectAnswers),
            correctAnswer: result.correctAnswer,
          );
          print("${result.incorrectAnswers.length}");
          print(quizQuestion.id);

          questions.add(quizQuestion);
          i++;
        }

        return questions;
      } else {
        return [];
      }
    } catch (e) {
      if (e is SocketException) {
        throw Exception('No internet connection');
      } else {
        throw Exception('Error occurred: $e');
      }
    }
  }

  static List<String> _randomizeOptions(
      String correctAnswer, List<String> incorrectAnswers) {
    List<String> options = [...incorrectAnswers, correctAnswer];
    options.shuffle(Random());
    return options;
  }

  //*Variable Declaration for the multi-choice quiz

  List<bool> buttonIsClickedM = [false, false, false, false];

  List<Color> buttonColorsM = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Color> textColorsM = [
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.purple,
  ];

//* Code Logic for multi-choice quiz
  int scoreM = 0;
  int totalScoreM = 0;
  String remarkM = "Well done !!";
  isCorrectM(
      {required String option1,
      required String option2,
      required String option3,
      required String option4,
      required int isClickedOption,
      required String correctOption}) {
    List<String> options = [option1, option2, option3, option4];
    int correctIndex = -1;
    int clickedIndex = isClickedOption;

    for (final opt in options) {
      if (opt == correctOption) {
        correctIndex = options.indexOf(opt);
        break;
      }
    }
    if (correctIndex != clickedIndex) {
      print("You  are wrong");
      buttonColorsM[0] = Colors.red;
      textColorsM[0] = Colors.white;
      buttonColorsM[1] = Colors.red;
      textColorsM[1] = Colors.white;
      buttonColorsM[2] = Colors.red;
      textColorsM[2] = Colors.white;
      buttonColorsM[3] = Colors.red;
      textColorsM[3] = Colors.white;
//Set the right answer to light green
      buttonColorsM[correctIndex] = Colors.green[300]!;
      textColorsM[correctIndex] = Colors.white;
    }

    if (correctIndex == clickedIndex) {
      print("You  are right");

      buttonColorsM[clickedIndex] = Colors.green;
      textColorsM[clickedIndex] = Colors.white;
      scoreM += 1;
      totalScoreM += 1;
    }

    notifyListeners();
    print('correct answer $correctOption');
    print('correct Index $correctIndex');
    print('clicked Index $clickedIndex');

    notifyListeners();
  }

  resetButtonColorsM() {
    buttonColorsM = [Colors.white, Colors.white, Colors.white, Colors.white];
    textColorsM = [
      Colors.purple,
      Colors.purple,
      Colors.purple,
      Colors.purple,
    ];
    notifyListeners();
  }

//*Variable Declaration for the true/false quiz
  List<Color> textColorsTF = [
    Colors.purple,
    Colors.purple,
    Colors.purple,
    Colors.purple,
  ];

  List<Color> buttonColorsTF = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<bool> buttonIsClickedTF = [false, false, false, false];

  //* Code Logic for true/false quiz

  int scoreTF = 0;
  int totalScoreTF = 0;
  String remarkTF = "Well done !!";

  isCorrectTF({
    required String option1,
    required String option2,
    required int isClickedOption,
    required String correctOption,
  }) {
    List<String> options = [option1, option2];

    int correctIndex = -1;
    int clickedIndex = isClickedOption;

    for (final opt in options) {
      if (opt == correctOption) {
        correctIndex = options.indexOf(opt);
        break;
      }
    }
    if (correctIndex != clickedIndex) {
      print("You  are wrong");
      buttonColorsTF[0] = Colors.red;
      textColorsTF[0] = Colors.white;
      buttonColorsTF[1] = Colors.red;
      textColorsTF[1] = Colors.white;

//Set the right answer to light green
      buttonColorsTF[correctIndex] = Colors.green[300]!;
      textColorsTF[correctIndex] = Colors.white;
    }

    if (correctIndex == clickedIndex) {
      print("You  are right");

      buttonColorsTF[clickedIndex] = Colors.green;
      textColorsTF[clickedIndex] = Colors.white;
      scoreTF += 1;
      totalScoreTF += 1;
    }

    notifyListeners();
    print('correct answer $correctOption');
    print('correct Index $correctIndex');
    print('clicked Index $clickedIndex');

    notifyListeners();
  }

  resetButtonColorsTF() {
    buttonColorsTF = [Colors.white, Colors.white, Colors.white, Colors.white];
    textColorsTF = [
      Colors.purple,
      Colors.purple,
      Colors.purple,
      Colors.purple,
    ];
    notifyListeners();
  }
}
