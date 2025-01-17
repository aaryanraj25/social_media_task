class QuestionModel {
  final String title;
  final String? description;
  final List<OptionModel> options;
  final int participantCount;
  final Duration timeLeft;

  QuestionModel({
    required this.title,
    this.description,
    required this.options,
    required this.participantCount,
    required this.timeLeft,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      title: json['title'],
      description: json['description'],
      options: (json['options'] as List)
          .map((option) => OptionModel.fromJson(option))
          .toList(),
      participantCount: json['participantCount'],
      timeLeft: Duration(minutes: json['timeLeftMinutes']),
    );
  }
}

class OptionModel {
  final String id;
  final String text;
  final bool isSelected;

  OptionModel({
    required this.id,
    required this.text,
    this.isSelected = false,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      text: json['text'],
      isSelected: json['isSelected'] ?? false,
    );
  }
}
