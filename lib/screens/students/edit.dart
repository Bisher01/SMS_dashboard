import 'package:flutter/material.dart';
import '../screens.dart';
import '../../components/components.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(),
      drawer: CustomDrawer(),
    );
  }
}
