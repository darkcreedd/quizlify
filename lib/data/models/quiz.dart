// // To parse this JSON data, do
// //
// //     final quiz = quizFromJson(jsonString);

// import 'dart:convert';

// Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

// String quizToJson(Quiz data) => json.encode(data.toJson());

// class Quiz {
//   int responseCode;
//   List<Result> results;

//   Quiz({
//     required this.responseCode,
//     required this.results,
//   });

//   factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
//         responseCode: json["response_code"],
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "response_code": responseCode,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//       };
// }

// class Result {
//   String category;
//   Type type;
//   Difficulty difficulty;
//   String question;
//   String correctAnswer;
//   List<String> incorrectAnswers;

//   Result({
//     required this.category,
//     required this.type,
//     required this.difficulty,
//     required this.question,
//     required this.correctAnswer,
//     required this.incorrectAnswers,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         category: json["category"],
//         type: typeValues.map[json["type"]]!,
//         difficulty: difficultyValues.map[json["difficulty"]]!,
//         question: json["question"],
//         correctAnswer: json["correct_answer"],
//         incorrectAnswers:
//             List<String>.from(json["incorrect_answers"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "category": category,
//         "type": typeValues.reverse[type],
//         "difficulty": difficultyValues.reverse[difficulty],
//         "question": question,
//         "correct_answer": correctAnswer,
//         "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
//       };
// }

// enum Difficulty { easy, medium, hard }

// final difficultyValues = EnumValues({
//   "easy": Difficulty.easy,
//   "medium": Difficulty.medium,
//   "difficult": Difficulty.hard
// });

// enum Type { multiple, boolean }

// final typeValues =
//     EnumValues({"boolean": Type.boolean, "multiple": Type.multiple});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  int responseCode;
  List<Result> results;

  Quiz({
    required this.responseCode,
    required this.results,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        responseCode: json["response_code"] ?? 0,
        results: List<Result>.from(
            (json["results"] as List<dynamic>).map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String category;
  Type? type;
  Difficulty? difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"] ?? "",
        type: typeValues.map[json["type"]] ?? Type.multiple,
        difficulty: difficultyValues.map[json["difficulty"]] ?? Difficulty.easy,
        question: json["question"] ?? "",
        correctAnswer: json["correct_answer"] ?? "",
        incorrectAnswers: List<String>.from(
            (json["incorrect_answers"] as List<dynamic>)
                .map((x) => x.toString())),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };
}

enum Difficulty { easy, medium, hard }

final difficultyValues = EnumValues({
  "easy": Difficulty.easy,
  "medium": Difficulty.medium,
  "hard": Difficulty.hard
});

enum Type { multiple, boolean }

final typeValues =
    EnumValues({"multiple": Type.multiple, "boolean": Type.boolean});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
