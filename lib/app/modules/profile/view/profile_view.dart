import 'package:aaj_tak/app/data/values/images.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/utils/components/actions/action_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/values/strings.dart';
import '../controller/profile_controller.dart';
import '../widgets/tab_bar.dart';
import 'add_new_profile.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.orange,
          ),
        ),
        elevation: 0.0,
        backgroundColor: AppColors.white,
        title: GestureDetector(
            onTap: () {},
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 10, top: 10.0),
                child: Image.asset(
                  ImagePath.logo,
                  height: 70.0,
                ),
              ),
            )),
        actions: [
          ActionIcon(
            fromProfile: true,
            icon: ImagePath.profile,
            onTap: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(child: tabBar()),
      ),
    );
  }
}
