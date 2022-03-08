import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:lern_app/domain/subject.dart';
import 'package:lern_app/widgets/subject_tile.dart';

class SubjectView extends StatelessWidget {
  final List<Subject> fullLearnSubjectList;
  final void Function(Subject delSubject) delSubjectTile;

  const SubjectView(this.fullLearnSubjectList, this.delSubjectTile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(fullLearnSubjectList[0].name),
                    ),
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: LinearProgressIndicator(
                            minHeight: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
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
