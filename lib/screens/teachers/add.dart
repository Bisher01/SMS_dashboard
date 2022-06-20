import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../utill/widget_size.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {

  DateTime? _selectedDate;
  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.red,);
    return ListView(
        children: [
          //fname lname email
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width:widgetSize.getWidth(50, context),child: TextFormField()),
                Container(width:widgetSize.getWidth(50, context),child: TextFormField()),
                Container(width:widgetSize.getWidth(50, context),child: TextFormField()),
              ],
            ),
          ),
          //gender  bloodtype address grades
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String?>(
                  items: [],
                  onChanged: (value) {},
                ),
                DropdownButton<String?>(
                  items: [],
                  onChanged: (value) {},
                ),
                DropdownButton<String?>(
                  items: [],
                  onChanged: (value) {},
                ),
                DropdownButton<String?>(
                  items: [],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          //join date
          ElevatedButton(
            onPressed: () {
              _presentDatePicker();
            },
            child: Text(
              'date',
            ),
          ),
        ],
    );
  }
}
