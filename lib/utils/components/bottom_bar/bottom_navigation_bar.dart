import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aaj_tak/app/data/values/images.dart';
import 'package:aaj_tak/app/data/values/strings.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;

  const MyBottomNavigationBar(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);

  _bottomNavigationBarItem({required String asset, String? label, int? index}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        asset,
        height: 24,
        width: 24,
        color: index == currentIndex ? AppColors.orange : AppColors.grey,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: Styles.tsBottomLabel,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.orange,
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 12,
      items: [
        _bottomNavigationBarItem(
          index: 0,
          label: Strings.home,
          asset: ImagePath.home,
        ),
        _bottomNavigationBarItem(
          index: 1,
          label: Strings.talk,
          asset: ImagePath.talk,
        ),
        _bottomNavigationBarItem(
          index: 2,
          label: Strings.askQuestion,
          asset: ImagePath.askQuestion,
        ),
        _bottomNavigationBarItem(
          index: 3,
          label: Strings.reports,
          asset: ImagePath.reports,
        ),
        _bottomNavigationBarItem(
          index: 4,
          label: Strings.chat,
          asset: ImagePath.chat,
        ),
      ],
    );
  }
}
