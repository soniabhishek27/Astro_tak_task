import 'package:aaj_tak/app/modules/ask_questions/views/ask_question_view.dart';
import 'package:aaj_tak/app/modules/dashboard/binding/dashboard_binding.dart';
import 'package:aaj_tak/app/modules/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';

import '../modules/ask_questions/bindings/ask_question_binding.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/view/profile_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.ASK_QUESTIONS,
        page: () => AskQuestionsView(),
        binding: AskQuestionBinding()),
    GetPage(
      name: Routes.FRIENDS_AND_FAMILY,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
        name: Routes.DASHBOARD,
        page: () => DashBoardView(),
        binding: DashBoardBinding())
  ];
}
