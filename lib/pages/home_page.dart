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


  void _delSubjectTile(Subject delSubject){
    setState(() {
        _fullLearnSubjectList.remove(delSubject);
    });
  }



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

    Map<String, String> _progressMap = {for (var e in _fullLearnSubjectList) e.name : e.studyTime};
    String? dropdownValue = subjects[0];

    void _updateSubjectList(Subject newSubject){
      setState(() {
        _fullLearnSubjectList.add(newSubject);
        if(_progressMap.containsKey(newSubject.name)){
          var temp = _progressMap.entries.where((element) => element.key == newSubject.name);
          _progressMap.update(newSubject.name, (value) => (value + temp.first.value));
          return;
        }
        Map<String,String> newMapEntry = { newSubject.name : newSubject.studyTime};
        _progressMap.addAll(newMapEntry);
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
