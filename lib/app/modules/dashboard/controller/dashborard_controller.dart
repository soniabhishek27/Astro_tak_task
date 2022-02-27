import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ask_questions/views/ask_question_view.dart';
import '../../profile/view/profile_view.dart';

class DashBoardController extends GetxController {
  RxInt navIndex = RxInt(2);

  void changeTabIndex(int i) {
    navIndex.value = i;
  }

  Widget buildContentBody(int i) {
    switch (i) {
      case 0:
        {
          return AskQuestionsView();
        }
      case 1:
        {
          return AskQuestionsView();
        }
      case 2:
        {
          return AskQuestionsView();
        }
      case 3:
        {
          return AskQuestionsView();
        }
      case 4:
        {
          return AskQuestionsView();
        }
      default:
        {
          return ProfileView();
        }
    }
  }

  @override
  void onClose() {
    navIndex.value = 0;
  }
}
