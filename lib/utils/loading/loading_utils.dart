import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static var isLoaderShowing = false;

  static void showLoader() {
    if (!isLoaderShowing) {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Center(
              child: CircularProgressIndicator(
            color: AppColors.blue,
          )),
        ),
        barrierDismissible: false,
      );
      isLoaderShowing = true;
    }
  }

  static void hideLoader() {
    if (isLoaderShowing) {
      Get.back();
      isLoaderShowing = false;
    }
  }
}
