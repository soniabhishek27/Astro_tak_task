import 'package:aaj_tak/app/data/models/dto/response.dart';
import 'package:aaj_tak/app/data/models/request/add_relatives.dart';
import 'package:aaj_tak/app/data/models/response/relatives_response.dart';
import 'package:aaj_tak/app/data/values/urls.dart';
import 'package:aaj_tak/base/base_repository.dart';
import 'package:aaj_tak/helper/exception_handler.dart';

class ProfileRepository extends BaseRepository {
  Future<dynamic?> getRelatives() async {
    var response = await controller.get(path: URLs.relativesUrl);
    if (response is APIException) {
      var relatives = response.message;
      return null;
      // return RepoResponse(error: response);
    } else {
      var relatives = RelativeData.fromJson(response);
      return relatives;

      // return RepoResponse(data: RelativesData.fromJson(response).data);
    }
  }

  Future<dynamic> deleteProfile(String id) async {
    var response = await controller.post(path: URLs.deleteProfile(id: id));

    if (response is APIException) {
      return response.message;
    } else {
      return response;
    }
  }

  Future<RepoResponse> addProfile(AddRelatives addRelatives) async {
    var response = await controller.post(
        path: URLs.allRelative, data: addRelatives.toJson());

    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      return RepoResponse(data: response);
    }
  }
}
