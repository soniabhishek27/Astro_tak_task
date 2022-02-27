import 'package:aaj_tak/app/data/values/strings.dart';
import 'package:aaj_tak/app/modules/ask_questions/widget/notes_card.dart';
import 'package:aaj_tak/app/themes/app_colors.dart';
import 'package:aaj_tak/app/themes/dimensions.dart';
import 'package:aaj_tak/app/themes/styles.dart';
import 'package:flutter/material.dart';
import '../../../data/models/response/questions_response.dart';

class QuestionsList extends StatelessWidget {
  final List<dynamic>? questionData;

  const QuestionsList({Key? key, @required this.questionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.padding10, right: Dimens.padding10),
      child: Column(
        children: [
          Text(
            Strings.ideasToAsk,
            style: Styles.tsBold16.copyWith(color: AppColors.black),
          ),
          Container(
            height: 100.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: questionData?.length,
                itemBuilder: (context, index) {
                  return Text('${questionData?[index]}');
                }),
          ),
          Container(
            height: 100.0,
            child: Text(''
                'Seeking accurate answers to difficult quesitons troubling your ming'
                '? ask astrologers to know what future has in store for you'
                ''),
          ),

          NotesCard(),
        ],
      ),
    );
  }
}
