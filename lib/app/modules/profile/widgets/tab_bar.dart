import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/add_new_profile.dart';
import '../view/profile_view.dart';
import '../view/relatives_view.dart';

Widget tabBar() {
  return Container(
    height: Get.height - (kToolbarHeight * 2),
    child: DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TabBar(
            isScrollable: false,
            //tod
            indicatorPadding: EdgeInsets.zero,
            tabs: [
              Tab(text: Strings.myProfile),
              Tab(text: Strings.orderHistory),
            ],
            indicatorColor: AppColors.orange,
            labelColor: AppColors.orange,
            unselectedLabelColor: AppColors.darkGrey,
            indicatorWeight: 2,
            indicator: BoxDecoration(
                color: AppColors.white,
                border: Border(
                    bottom: BorderSide(color: AppColors.orange, width: 2))),
          ),
          // SizedBox(height: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TabBarView(
                children: [
                  RelativesView(),
                  AddNewProfileView(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
