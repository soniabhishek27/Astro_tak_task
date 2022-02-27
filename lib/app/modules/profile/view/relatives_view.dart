import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/app/modules/profile/view/add_new_profile.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/buttons/profile_button.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_switch.dart';
import '../widgets/profile_wallet.dart';
import '../widgets/relatives_list.dart';

class RelativesView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: controller.addProfile == true
            ? AddNewProfileView()
            : ListView(
                children: [
                  ProfileSwitch(),
                  SizedBox(
                    height: 10.0,
                  ),
                  ProfileWallet(),
                  if (controller.allRelatives.length > 0) ...[
                    FieldsTitle(),
                  ],
                  Obx(
                    () => controller.relativeDataStatus ==
                                RelativesDataStatus.initial ||
                            controller.relativeDataStatus ==
                                RelativesDataStatus.loading
                        ? Center(child: Text('Loading'))
                        : Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              controller.allRelatives.length > 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.allRelatives.length,
                                      itemBuilder: (context, index) {
                                        return RelativesList(
                                          allRelative:
                                              controller.allRelatives[index],
                                          onDelete: () async {
                                            // controller.allRelatives.removeAt(index);
                                            await controller.deleteRelative(
                                                id: controller
                                                    .allRelatives[index]?.uuid,
                                                index: index);
                                          },
                                        );
                                      },
                                    )
                                  : Text(Strings.noData),
                              SizedBox(
                                height: 50.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: ProfileButton(
                                    title: Strings.addNewProfile,
                                    onTap: () {
                                      controller.addProfile.value = true;
                                    },
                                  )),
                            ],
                          ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget FieldsTitle() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.padding8, right: Dimens.padding8, top: Dimens.padding8),
      child: Row(
        children: [
          Expanded(child: Text(Strings.name, style: Styles.tsBlue14)),
          Expanded(child: Text(Strings.dob, style: Styles.tsBlue14)),

          Expanded(child: Text(Strings.relation, style: Styles.tsBlue14)),

          Expanded(child: Text('', style: Styles.tsBlue14)),

          // Expanded(child: Text(Strings.name, style: Styles.tsBlue14)),
        ],
      ),
    );
  }
}
