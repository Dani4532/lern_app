import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:lern_app/domain/subject.dart';
import 'package:lern_app/widgets/progerss_bar.dart';
import 'package:lern_app/widgets/subject_tile.dart';

class SubjectView extends StatelessWidget {
  final List<Subject> fullLearnSubjectList;
  final void Function(Subject delSubject) delSubjectTile;

  SubjectView(this.fullLearnSubjectList, this.delSubjectTile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Map<String, String> progressMap = {for (var e in fullLearnSubjectList) e.name : e.studyTime};
    return Container(
        child: Column(
      children: [
        Expanded(
          //singelChildeScrollfield
          child: ListView.builder(
            itemBuilder: (_, index) => ProgressBar(progressMap, index),
            itemCount: progressMap.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) =>
                SubjectTile(fullLearnSubjectList[index], delSubjectTile),
            itemCount: fullLearnSubjectList.length,
          ),
        ),
      ],
    ));
  }
}
