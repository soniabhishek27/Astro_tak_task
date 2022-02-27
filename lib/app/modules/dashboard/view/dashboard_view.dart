import 'package:aaj_tak/app/app.dart';
import 'package:aaj_tak/app/data/values/images.dart';
import 'package:aaj_tak/app/modules/dashboard/controller/dashborard_controller.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/utils/components/actions/action_icon.dart';
import 'package:aaj_tak/utils/components/bottom_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/binding/profile_binding.dart';
import '../../profile/view/profile_view.dart';

class DashBoardView extends GetView<DashBoardController> {
  final GlobalKey<ScaffoldState> dashKey = GlobalKey<ScaffoldState>();

  DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: dashKey,
      appBar: AppBar(
        leading: ActionIcon(
          icon: ImagePath.hamburger,
          onTap: () {},
        ),
        elevation: 0.0,
        backgroundColor: AppColors.white,
        title: GestureDetector(
            onTap: () {
              controller.changeTabIndex(0);
            },
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
            onTap: () {
              Get.to(() => ProfileView(), binding: ProfileBinding());
            },
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => MyBottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.navIndex.value,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.buildContentBody(controller.navIndex.value),
        ),
      ),
    );
  }
}
