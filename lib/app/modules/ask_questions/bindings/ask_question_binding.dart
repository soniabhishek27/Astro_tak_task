import 'package:get/get.dart';

import '../controllers/ask_question_controller.dart';

class AskQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskQuestionController>(() => AskQuestionController());
  }
}
