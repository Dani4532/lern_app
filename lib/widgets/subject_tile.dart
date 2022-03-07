import 'package:flutter/material.dart';
import 'package:lern_app/domain/subject.dart';

class SubjectTile extends StatelessWidget {
  final Subject fullLearnSubjectList;
  final void Function(Subject delSubject) delSubjectTile;

  const SubjectTile(this.fullLearnSubjectList, this.delSubjectTile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.blueAccent,
              width: 2.0,
            ),
          ),
          child: Text(
            fullLearnSubjectList.studyTime.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        title: Text(fullLearnSubjectList.name),
        subtitle: Text(fullLearnSubjectList.date),
        trailing: IconButton(
          onPressed: () {
            delSubjectTile(fullLearnSubjectList);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
