import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/buttons/wallet_button.dart';
import '../../../data/values/strings.dart';
import '../../../themes/styles.dart';

class ProfileWallet extends StatelessWidget {
  const ProfileWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 15,
      decoration: BoxDecoration(
        color: AppColors.walletLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: Dimens.gap8, right: Dimens.padding10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.account_balance_wallet_rounded,
              color: AppColors.blue,
            ),
            const SizedBox(
              width: Dimens.gap8,
            ),
            Text(Strings.walletBalance,
                style: Styles.tsPrimary14.copyWith(color: AppColors.blue)),
            const SizedBox(
              width: Dimens.gap8,
            ),
            const WalletButton(
              title: Strings.addMoney,
            )
          ],
        ),
      ),
    );
  }
}
