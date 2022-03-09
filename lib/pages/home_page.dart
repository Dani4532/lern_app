import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lern_app/domain/subject.dart';
import 'package:lern_app/widgets/add_bottom_sheet.dart';
import 'package:lern_app/widgets/default_widget.dart';
import 'package:lern_app/widgets/subject_View.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Subject> _fullLearnSubjectList = [];

  Map<String, String> _progressMap = {};





  @override
  Widget build(BuildContext context) {
    var subjects = [
      'POS',
      'AM',
      'NVS',
      'GGP',
      'E',
      'D',
      'DBI',
      'SYP',
      'BWM',
    ];


    String? dropdownValue = subjects[0];

    void _delSubjectTile(Subject delSubject){
      setState(() {
        _fullLearnSubjectList.remove(delSubject);
        if(_progressMap.keys.contains(delSubject.name)){
          var temp = _progressMap.entries.where((element) => element.key == delSubject.name);
          _progressMap.update(delSubject.name, (value) => ((int.parse(value) - int.parse(delSubject.studyTime)).toString()));
          if(int.parse(temp.first.value) == 0){
            _progressMap.removeWhere((key, value) => key == delSubject.name);
          }
        }
      });
    }

    void _updateSubjectList(Subject newSubject){
      setState(() {
        _fullLearnSubjectList.add(newSubject);

        if(_progressMap.containsKey(newSubject.name)){
          _progressMap.update(newSubject.name, (value) => ((int.parse(value) + int.parse(newSubject.studyTime)).toString()));
        }

        _progressMap.putIfAbsent(newSubject.name, () => newSubject.studyTime);
      });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('My studies'),
      ),
      body: (_fullLearnSubjectList.isEmpty) ? DefaultWidget() : SubjectView(_fullLearnSubjectList, _delSubjectTile, _progressMap),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddBottomSheet(
              subjects,
              dropdownValue,
              _fullLearnSubjectList,
              _updateSubjectList,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
