import 'package:aaj_tak/app/data/models/dto/response.dart';
import 'package:aaj_tak/app/data/values/urls.dart';
import 'package:aaj_tak/base/base_repository.dart';
import 'package:aaj_tak/helper/exception_handler.dart';

import '../models/response/questions_response.dart';

class AskQuestionRepository extends BaseRepository {
  Future<RepoResponse> getAnswer() async {
    var response = await controller.get(path: URLs.askQuestion('all'));
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      var data = AskQuestionsResponse.fromJson(response).data;
      return RepoResponse(data: data);
    }
  }
}
