import 'package:aaj_tak/app/modules/ask_questions/controllers/ask_question_controller.dart';
import 'package:aaj_tak/app/modules/dashboard/controller/dashborard_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());

    Get.lazyPut<AskQuestionController>(() => AskQuestionController());

    // Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
