import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String? title;
  VoidCallback? onTap;

  ProfileButton({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(Dimens.margin8)),
        child: Center(
          child: Text(
            title!,
            style: Styles.tsNormal14.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
