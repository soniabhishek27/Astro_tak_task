import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/styles.dart';

class ProfileSwitch extends StatelessWidget {
  const ProfileSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: switchCard(
                  title: 'Basic Profile',
                  colour: AppColors.white,
                  style: Styles.tsNormal14.copyWith(color: AppColors.black))),
          Expanded(
              child: switchCard(
                  title: 'Friends and Family Profile',
                  colour: AppColors.orange,
                  style: Styles.tsNormal14.copyWith(color: AppColors.white))),
        ],
      ),
    );
  }
  Widget switchCard({String? title, Color? colour, TextStyle? style}) {
    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(5.0)),
      child: Center(
        child: Text(title ?? '', style: style),
      ),
    );
  }

}
