import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:aaj_tak/widgets/buttons/profile_button.dart';
import 'package:aaj_tak/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/dimensions.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_switch.dart';

class AddNewProfileView extends GetView<ProfileController> {
  const AddNewProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: AppColors.offWhite,
      child: ListView(
        children: [
          ProfileSwitch(),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(Dimens.padding8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.addProfile.value = false;
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                    size: 20.0,
                  ),
                ),
                SizedBox(
                  width: Dimens.gap4,
                ),
                Text(
                  Strings.addNew,
                  style: Styles.tsPrimary18,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                fieldHeading(Strings.name),
                CustomTextField(wrapper: controller.nameWrapper, hintText: ''),
                SizedBox(
                  height: 10.0,
                ),
                fieldHeading(Strings.dobFull),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        maxLength: 2,
                        wrapper: controller.dobDateWrapper,
                        hintText: 'DD',
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                          maxLength: 2,
                          wrapper: controller.dobMonthWrapper,
                          hintText: 'MM'),
                    ),
                    Expanded(
                      child: CustomTextField(
                          maxLength: 4,
                          wrapper: controller.dobYearWrapper,
                          hintText: 'YYYY'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                fieldHeading(Strings.tobFull),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          maxLength: 2,
                          wrapper: controller.tobHourWrapper,
                          hintText: 'HH'),
                    ),
                    Expanded(
                      child: CustomTextField(
                          maxLength: 2,
                          wrapper: controller.tobMinuteWrapper,
                          hintText: 'MM'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                fieldHeading(Strings.pobFull),
                CustomTextField(
                    wrapper: controller.pobWrapperWrapper, hintText: ''),
                SizedBox(
                  height: 30.0,
                ),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: DropdownButton<dynamic>(
                          icon: Icon(Icons.arrow_drop_down),
                          isExpanded: false,
                          style: Styles.tsNormal14,
                          value: controller.genderValue.value,
                          onChanged: (newValue) {
                            controller.genderValue.value = newValue;
                          },
                          items: controller.gender
                              .map((element) => element)
                              .map<DropdownMenuItem<dynamic>>(
                                  (dynamic valueItem) {
                            return DropdownMenuItem<dynamic>(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: DropdownButton<dynamic>(
                          icon: Icon(Icons.arrow_drop_down),
                          isExpanded: false,
                          style: Styles.tsNormal14,
                          value: controller.relationValue.value,
                          onChanged: (newValue) {
                            controller.relationValue.value = newValue;

                            controller.relationId.value = controller
                                .getRelationId(relationName: newValue);
                          },
                          items: controller.relations
                              .map((element) => element)
                              .map<DropdownMenuItem<dynamic>>(
                                  (dynamic valueItem) {
                            return DropdownMenuItem<dynamic>(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                ProfileButton(
                  title: Strings.saveChanges,
                  onTap: () {
                    controller.addNewProfile();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget fieldHeading(String? title) {
    return Padding(
      padding: EdgeInsets.only(left: Dimens.padding4),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title!,
          style: Styles.tsNormal14,
        ),
      ),
    );
  }
}

// class AddNewProfileView extends GetView<ProfileController>
