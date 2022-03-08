import 'package:flutter/material.dart';
import 'package:lern_app/domain/subject.dart';

class ProgressBar extends StatelessWidget {
  final Map<String,String> progressMap;
  final int index;

  const ProgressBar(this.progressMap, this.index, {Key? key})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(progressMap.entries.elementAt(index).key,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: int.parse(progressMap.entries.elementAt(index).value) / 100,
            ),
          ),
        ),
      ],
    );
  }
}
