import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletButton extends StatelessWidget {
  final String? title;

  const WalletButton({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      width: 100.0,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.black)),
      child: Center(
          child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                title!,
                style: Styles.tsBlue12,
              ))),
    );
  }
}
