import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_task/data/models/question_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final Function(String) onOptionSelected;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/profile_image.png'),
          ),
          const SizedBox(height: 12),
          Text(
            'Angelina, 28',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...question.options.map((option) => _buildOptionButton(option)),
        ],
      ),
    );
  }

  Widget _buildOptionButton(OptionModel option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => onOptionSelected(option.id),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: option.isSelected
                ? Colors.purple.withOpacity(0.3)
                : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: option.isSelected ? Colors.purple : Colors.grey,
              width: 1,
            ),
          ),
          child: Text(
            option.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
