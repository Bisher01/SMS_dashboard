import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: const Color(
        0Xff2BC3BB,
      ),
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text(
              'Settings',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Students',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Teachers',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Subjects',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Daily Schedule',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Classes',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Classrooms',
            ),
          ),
          DrawerHeader(
            child: Text(
              'Exam Schedule',
            ),
          ),
        ],
      ),
    );
  }
}
