import 'package:get/get.dart';
import 'package:social_media_task/data/repo/question_repo.dart';
import '../../data/models/question_model.dart';

class QuestionController extends GetxController {
  final QuestionRepository repository;
  final Rx<QuestionModel?> currentQuestion = Rx<QuestionModel?>(null);
  final RxBool isLoading = false.obs;

  QuestionController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadCurrentQuestion();
  }

  Future<void> loadCurrentQuestion() async {
    isLoading.value = true;
    try {
      currentQuestion.value = await repository.getCurrentQuestion();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load question');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitAnswer(String optionId) async {
    if (currentQuestion.value == null) return;
    try {
      await repository.submitAnswer(
        currentQuestion.value!.title,
        optionId,
      );
      Get.snackbar('Success', 'Answer submitted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit answer');
    }
  }
}