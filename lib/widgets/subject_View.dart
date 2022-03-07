import 'package:flutter/material.dart';
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
                child: LinearProgressIndicator(

                ),
              ),
             /* LinearProgressIndicator(
                minHeight: 1000,
              ),
              LinearProgressIndicator(
                minHeight: 1000,
              ),
              LinearProgressIndicator(
                minHeight: 1000,
              ),

              */
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
