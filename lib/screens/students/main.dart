import 'package:flutter/material.dart';
import '../screens.dart';
import '../../components/components.dart';

class MainStudent extends StatefulWidget {
  const MainStudent({Key? key}) : super(key: key);

  @override
  State<MainStudent> createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
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
