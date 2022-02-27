import 'package:aaj_tak/app/data/models/response/relatives_response.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';

class RelativesList extends StatelessWidget {
  AllRelative? allRelative;
  VoidCallback? onDelete;
  VoidCallback? onEdit;

  RelativesList(
      {Key? key, @required this.allRelative, this.onDelete, this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding4),
      child: Container(
        height: 70.0,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.padding8),
            child: Row(
              children: [
                Expanded(child: Text('${allRelative?.firstName ?? 'NA'}',style: Styles.tsNormal14,)),
                Expanded(
                    child: Text('${allRelative?.dateAndTimeOfBirth ?? 'NA'}',style: Styles.tsNormal14,)),
                Expanded(child: Text('${allRelative?.relation ?? ''}',style: Styles.tsNormal14,)),
                // Expanded(child: Text('')),
                Expanded(
                  child: InkWell(
                    onTap: onEdit,
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.orange,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.redAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
