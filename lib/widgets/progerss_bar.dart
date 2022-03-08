import 'package:flutter/material.dart';
import 'package:lern_app/domain/subject.dart';

class ProgressBar extends StatelessWidget {
  final List<Subject> fullLearnSubjectList;
  final int index;

  const ProgressBar(this.fullLearnSubjectList, this.index, {Key? key})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(fullLearnSubjectList[index].name,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
