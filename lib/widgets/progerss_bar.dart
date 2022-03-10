import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {
  final Map<String, String> progressMap;
  final int index;

  const ProgressBar(this.progressMap, this.index, {Key? key}) : super(key: key);


  double fillProgressBar(){
    var sum = 0;
    progressMap.values.forEach((element) {sum += int.parse(element);});
    return  (double.parse(progressMap.values.elementAt(index)) / sum);
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            progressMap.entries.elementAt(index).key,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
          child: Text(
            progressMap.entries.elementAt(index).value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: fillProgressBar(),
                  //int.parse(progressMap.entries.elementAt(index).value) / 100,
            ),
          ),
        ),
      ],
    );
  }
}
