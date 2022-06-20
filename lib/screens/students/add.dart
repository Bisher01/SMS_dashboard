import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.amber,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          //fname lname email
          Row(
            children: [
              TextFormField(),
              TextFormField(),
              TextFormField(),
            ],
          ),
          //gender religion nationality bloodtype
          Row(
            children: [
              DropdownButton<String?>(items: [], onChanged:(value){},),
              DropdownButton<String?>(items: [], onChanged:(value){},),
              DropdownButton<String?>(items: [], onChanged:(value){},),
              DropdownButton<String?>(items: [], onChanged:(value){},),
            ],
          ),
          //class classroom academic year
          Row(
            children: [
              DropdownButton<String?>(items: [], onChanged:(value){},),
              DropdownButton<String?>(items: [], onChanged:(value){},),
              DropdownButton<String?>(items: [], onChanged:(value){},),
            ],
          ),
          //birthdate
          ElevatedButton(onPressed: (){_presentDatePicker();}, child: Text('date'))
        ],
      ),
    );
  }
}
