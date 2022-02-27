import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.lightOrange),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    'Personalized responses provided by our team of Vedic astrologers within 24 hours',
                style:
                    Styles.tsPrimary14.copyWith(color: AppColors.orange)),

            WidgetSpan(child: SizedBox(height: 10.0,)),

            TextSpan(
                text:
                    'Personalized responses provided by our team of Vedic astrologers within 24 hours',
                style:
                    Styles.tsPrimary14.copyWith(color: AppColors.orange)),
            TextSpan(
                text:
                    'Personalized responses provided by our team of Vedic astrologers within 24 hours',
                style:
                    Styles.tsPrimary14.copyWith(color: AppColors.orange)),
            TextSpan(
                text:
                    'Personalized responses provided by our team of Vedic astrologers within 24 hours',
                style:
                    Styles.tsPrimary14.copyWith(color: AppColors.orange)),
          ]))
        ],
      ),
    );
  }
}
