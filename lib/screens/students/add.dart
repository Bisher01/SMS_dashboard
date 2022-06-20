import 'package:flutter/material.dart';
import 'package:sms_dashboard/utill/widget_size.dart';
import '../../components/components.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  DateTime? _selectedDate;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
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
    //return Container(color: Colors.black,);
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        //fname lname email
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: widgetSize.getWidth(50, context),
                child: TextFormField()),
            Container(
                width: widgetSize.getWidth(50, context),
                child: TextFormField()),
            Container(
              width: widgetSize.getWidth(50, context),
              child: TextFormField(),
            ),
          ],
        ),
        //gender religion nationality blood type
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
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
        //class classroom academic year
        Row(
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
          ],
        ),
        //birthdate
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
