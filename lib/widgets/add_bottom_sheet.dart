import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:lern_app/domain/subject.dart';

class AddBottomSheet extends StatefulWidget {
  final List<String> subjects;
  List<Subject> fullLearnSubjectList;
  String? dropdownValue;
  final void Function(Subject newSubject) updateSubjectList;

  AddBottomSheet(this.subjects, this.dropdownValue, this.fullLearnSubjectList, this.updateSubjectList,
      {Key? key})
      : super(key: key);

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  late TextEditingController _controler = new TextEditingController();

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now().toString().split(' ');
    var date = dateTime.first.toString();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _controler,
            decoration: InputDecoration(labelText: 'Minuten'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: DateTimeField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              suffixIcon: Icon(Icons.event_note),
              labelText: 'Date',
            ),
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDate = value;
                dateTime = value.toString().split(' ');
                date = dateTime.first.toString();
                //print(date);
              });
              print(value);
            },
            selectedDate: selectedDate,
          ),
        ),
        DropdownButton(
            value: widget.dropdownValue,
            items: widget.subjects.map((String subjects) {
              return DropdownMenuItem(
                value: subjects,
                child: Text(subjects),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue!;
              });
            }),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              if(_controler.text.isEmpty){
                return null;
              }
              var newSubject = new Subject(widget.dropdownValue, _controler.text, date);
              widget.updateSubjectList(newSubject);
                Navigator.of(context).pop();
            },
            icon: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
