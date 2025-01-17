import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_task/data/models/question_model.dart';
import 'package:social_media_task/presentation/controllers/question_controller.dart';
import 'package:social_media_task/presentation/widgets/question_card.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final question = controller.currentQuestion.value;
        if (question == null) {
          return const Center(child: Text('No question available'));
        }

        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sunset_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(question),
                    const Spacer(),
                    QuestionCard(
                      question: question,
                      onOptionSelected: (optionId) {
                        controller.submitAnswer(optionId);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader(QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stroll Bonfire',
          style: Get.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.white.withOpacity(0.8)),
            const SizedBox(width: 4),
            Text(
              '${question.timeLeft.inHours}h ${question.timeLeft.inMinutes.remainder(60)}m',
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
            const SizedBox(width: 16),
            Icon(Icons.people, color: Colors.white.withOpacity(0.8)),
            const SizedBox(width: 4),
            Text(
              '${question.participantCount}',
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ],
        ),
      ],
    );
  }
}