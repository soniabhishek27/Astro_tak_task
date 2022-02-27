import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final bool fromProfile;

  const ActionIcon(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.fromProfile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: fromProfile
              ? const EdgeInsets.only(
                  right: Dimens.padding20, top: Dimens.padding10)
              : const EdgeInsets.only(
                  left: Dimens.padding8, top: Dimens.padding10),
          child: Image.asset(
            icon,
            height: 2.0,
            width: 30.0,
          )),
    );
  }
}
