import 'package:flutter/material.dart';
import 'package:sms_dashboard/components/components.dart';

class ShowTeacher extends StatefulWidget {
  const ShowTeacher({Key? key}) : super(key: key);

  @override
  State<ShowTeacher> createState() => _ShowTeacherState();
}

class _ShowTeacherState extends State<ShowTeacher> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ), itemBuilder: (BuildContext context, int index) {
        return TeacherShowCard();
    },
    );
  }
}
