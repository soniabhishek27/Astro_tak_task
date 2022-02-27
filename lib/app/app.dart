import 'package:aaj_tak/app/app_binding.dart';
import 'package:aaj_tak/app/data/values/env.dart';
import 'package:aaj_tak/app/routes/app_pages.dart';
import 'package:aaj_tak/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/network/network_requester.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.title,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.DASHBOARD,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      onInit: () {
        Get.put(NetworkRequester());
      },
      initialBinding: AppBinding(),
    );
  }
}
