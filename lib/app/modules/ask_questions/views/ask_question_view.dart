import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/app/modules/ask_questions/widget/questions_list_view.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:aaj_tak/widgets/buttons/wallet_button.dart';
import 'package:aaj_tak/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../controllers/ask_question_controller.dart';

class AskQuestionsView extends GetView<AskQuestionController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.padding4),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: Get.height / 12,
                color: AppColors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.padding10, right: Dimens.padding10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(Strings.walletBalance, style: Styles.tsBold16),
                      WalletButton(
                        title: Strings.addMoney,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimens.gap4),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.padding10, right: Dimens.padding10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: Strings.askAQuestion,
                        style: Styles.tsBold16.copyWith(color: AppColors.black),
                      ),
                      const WidgetSpan(
                          child: SizedBox(
                        height: Dimens.gap8,
                      )),
                      const TextSpan(
                        text: Strings.question,
                        style: Styles.tsNormal14,
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: Dimens.gap8),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.padding10, right: Dimens.padding10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: Strings.chooseCategory,
                        style: Styles.tsBold16.copyWith(color: AppColors.black),
                      ),
                    ]),
                  ),
                ),
              ),
              Obx(() => controller.categoryValue == ""
                  ? Text('Loading')
                  : Container(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.padding10, right: Dimens.padding10),
                          child: DropdownButton<dynamic>(
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: false,
                            style:
                                TextStyle(color: Colors.black, fontSize: 22.0),
                            value: controller.categoryValue.value,
                            onChanged: (newValue) {
                              controller.categoryValue.value = newValue;
                              controller.updateAnswers();
                            },
                            items: controller.questionsData
                                .map((element) => element.name)
                                .map<DropdownMenuItem<dynamic>>(
                                    (dynamic valueItem) {
                              return DropdownMenuItem<dynamic>(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          )),
                    )),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: Dimens.padding10, right: Dimens.padding10),
                height: 100.0,
                child: TextField(
                  controller: controller.askQuestionWrapper.controller,
                  maxLines: 10,
                  cursorColor: AppColors.black,
                  decoration: const InputDecoration(
                    hoverColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "Type a question here",
                    focusColor: Colors.black,
                  ),
                ),
              ),
              Obx(
                () => controller.particularQuestionList.length != 0
                    ? QuestionsList(
                        questionData: controller.particularQuestionList,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          Container(
            height: Get.height / 15,
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.black)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.padding10, right: Dimens.padding10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(Strings.questionPrice, style: Styles.tsPrimary14),
                  WalletButton(
                    title: Strings.askNow,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
