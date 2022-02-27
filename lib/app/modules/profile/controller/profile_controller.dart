import 'package:aaj_tak/app/data/models/request/add_relatives.dart';
import 'package:aaj_tak/app/data/models/response/relatives_response.dart';
import 'package:aaj_tak/app/data/repository/profile_repository.dart';
import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/utils/loading/loading_utils.dart';
import 'package:get/get.dart';
import '../../../../helper/text_field_wrapper.dart';

enum RelativesDataStatus { initial, loading, success, failure }

class ProfileController extends GetxController {
  //TODO: Implement AboutController

  final nameWrapper = TextFieldWrapper();
  final dobDateWrapper = TextFieldWrapper();
  final dobMonthWrapper = TextFieldWrapper();
  final dobYearWrapper = TextFieldWrapper();
  final tobHourWrapper = TextFieldWrapper();
  final tobMinuteWrapper = TextFieldWrapper();
  final pobWrapperWrapper = TextFieldWrapper();

  var gender = ['MALE', 'FEMALE'];

  RxString genderValue = RxString('MALE');

  var relations = ['Friend', 'Mother', 'Father', 'Brother', 'Son'];

  //son 6 brother 3 mother 2 father 1

  RxString relationValue = RxString('Mother');

  RxInt relationId = RxInt(2);

  RxList<RelativeData> newR = RxList();

  RxBool addProfile = RxBool(false);

  RxList<AllRelative?> allRelatives = RxList();

  RxString da = RxString('initial');

  final _relativeDataStatus =
      Rx<RelativesDataStatus>(RelativesDataStatus.initial);

  get relativeDataStatus => this._relativeDataStatus.value;

  @override
  void onInit() {
    getRelatives();
    super.onInit();
  }

  var profileRepo = ProfileRepository();

  getRelatives() async {
    var data = await profileRepo.getRelatives();
    if (data == null) {
      _relativeDataStatus.value = RelativesDataStatus.failure;
    } else {
      allRelatives.assignAll(data?.data?.allRelatives);
      _relativeDataStatus.value = RelativesDataStatus.success;
    }
  }

  bool isValidated() {
    var name = nameWrapper.controller.text.trim();
    var dobDate = dobDateWrapper.controller.text.trim();
    var dobMonth = dobMonthWrapper.controller.text.trim();
    var dobYear = dobYearWrapper.controller.text.trim();
    var tobHour = tobHourWrapper.controller.text.trim();
    var tobMinute = tobMinuteWrapper.controller.text.trim();
    var place = pobWrapperWrapper.controller.text.trim();

    if (name.isEmpty) {
      nameWrapper.errorText = ErrorMessages.invalidName;
      return false;
    }

    nameWrapper.errorText = '';

    if (dobDate.length < 1) {
      dobDateWrapper.errorText = ErrorMessages.invalidDD;

      return false;
    }
    dobDateWrapper.errorText = '';

    if (dobMonth.length < 1) {
      dobMonthWrapper.errorText = ErrorMessages.invalidMM;

      return false;
    }

    dobMonthWrapper.errorText = '';

    if (dobYear.length < 4) {
      dobYearWrapper.errorText = ErrorMessages.invalidYY;

      return false;
    }

    dobYearWrapper.errorText = '';

    if (tobHour.length < 1) {
      tobHourWrapper.errorText = ErrorMessages.invalidHH;

      return false;
    }

    tobHourWrapper.errorText = '';

    if (tobMinute.length < 1) {
      tobMinuteWrapper.errorText = ErrorMessages.invalidMM;
      return false;
    }
    tobMinuteWrapper.errorText = '';

    if (place.isEmpty) {
      pobWrapperWrapper.errorText = ErrorMessages.invalidCity;
      return false;
    }
    pobWrapperWrapper.errorText = '';

    return true;
  }

  deleteRelative({String? id, int? index}) async {
    Loader.showLoader();
    var result = await profileRepo.deleteProfile(id!);
    allRelatives.removeAt(index!);
    Loader.hideLoader();
  }

  addNewProfile() async {
    if (isValidated()) {
      Loader.showLoader();
      AddRelatives addRelatives = AddRelatives(
          firstName: nameWrapper.controller.text.trim(),
          lastName: ' ',
          relationId: relationId.value,
          gender: genderValue.value,
          birthDetails: BirthDetails(
              dobDay: int.parse(dobDateWrapper.controller.text.trim()),
              dobMonth: int.parse(dobMonthWrapper.controller.text.trim()),
              dobYear: int.parse(dobDateWrapper.controller.text.trim()),
              tobHour: double.parse(tobHourWrapper.controller.text.trim()),
              tobMin: double.parse(tobMinuteWrapper.controller.text.trim()),
              meridiem: 'AM'),
          birthPlace: BirthPlace(
              placeId: 'ChIJwTa3v_6nkjkRC_b2yajUF_M',
              placeName: 'Kulharia, Bihar, India'));

      var response = await profileRepo.addProfile(addRelatives);

      if (response.error == null) {
        addProfile.value = false;
        Loader.hideLoader();

        Get.snackbar(Strings.success, Strings.profileAdded,
            duration: Duration(seconds: 5));
        await getRelatives();
      }
    }
  }

  int getRelationId({String? relationName}) {
    switch (relationName) {
      case 'Mother':
        return 2;

      case 'Father':
        return 1;

      case 'Brother':
        return 3;

      case 'Son':
        return 6;

      case 'Friend':
        return 5;

      default:
        return 1;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
