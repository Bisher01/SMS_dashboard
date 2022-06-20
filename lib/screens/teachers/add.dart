import 'package:flutter/material.dart';
import '../../components/components.dart';

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
    return ListView(
        children: [
          //fname lname email
          Row(
            children: [
              TextFormField(),
              TextFormField(),
              TextFormField(),
            ],
          ),
          //gender  bloodtype address grades
          Row(
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
