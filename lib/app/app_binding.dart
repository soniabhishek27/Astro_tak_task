import 'package:get/get.dart';

import 'data/network/network_requester.dart';
import 'data/repository/ask_questions_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    // TODO: implement dependencies
  }
}
