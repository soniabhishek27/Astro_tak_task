import 'package:aaj_tak/app/data/models/response/questions_response.dart';
import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/helper/text_field_wrapper.dart';
import 'package:get/get.dart';
import '../../../data/models/dto/response.dart';
import '../../../data/repository/ask_questions_repository.dart';

class AskQuestionController extends GetxController {
  //TODO: Implement AboutController

  var askQuestionRepo = AskQuestionRepository();

  RxList<AskQuestionData> questionsData = RxList();

  RxList<dynamic> particularQuestionList = RxList();

  RxString categoryValue = RxString("");

  final askQuestionWrapper = TextFieldWrapper();

  @override
  void onInit() {
    super.onInit();
  }

  getAnswer() async {
    questionsData.clear();
    RepoResponse response = await askQuestionRepo.getAnswer();
    if (response.error == null) {
      questionsData.addAll(response.data);
      categoryValue.value = questionsData[0].name.toString();
      updateAnswers();
    } else {
      Get.rawSnackbar(message: '${response.error?.message}');
    }
  }

  updateAnswers() {
    for (var i in questionsData) {
      if (i.name == categoryValue.value) {
        String newList = i.suggestions.toString().splitMapJoin(',');
        // newList.split(',');
        print("new is $newList");
        particularQuestionList.assign(newList);
      }
    }

    print("len is ${particularQuestionList.length}");
  }

  @override
  void onReady() {
    super.onReady();
    getAnswer();
  }

  @override
  void onClose() {}
}
