import 'package:social_media_task/data/models/question_model.dart';

abstract class QuestionRepository {
  Future<QuestionModel> getCurrentQuestion();
  Future<void> submitAnswer(String questionId, String optionId);
}

class QuestionRepositoryImpl implements QuestionRepository {
  @override
  Future<QuestionModel> getCurrentQuestion() async {
    return QuestionModel(
      title: "What is your favorite time of the day?",
      options: [
        OptionModel(id: "A", text: "The peace in the early mornings"),
        OptionModel(id: "B", text: "The magical golden hours"),
        OptionModel(id: "C", text: "Wind-down time after dinners"),
        OptionModel(id: "D", text: "The serenity past midnight"),
      ],
      participantCount: 103,
      timeLeft: Duration(hours: 22),
    );
  }

  @override
  Future<void> submitAnswer(String questionId, String optionId) async {
    // Answer Submission Logic
  }
}

