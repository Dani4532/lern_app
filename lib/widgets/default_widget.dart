import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Study some'),
      ),
    );
  }
}
