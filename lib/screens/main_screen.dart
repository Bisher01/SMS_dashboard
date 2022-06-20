import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/screens.dart';
import '../utill/widget_size.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedTab = 0;

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    const Settings(),
    const AddStudent(),
    const EditStudent(),
    const ShowStudent(),
    const AddTeacher(),
    const EditTeacher(),
    const ShowTeacher(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: widgetSize.getWidth(100, context),
          color: const Color(
            0Xff2BC3BB,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SvgPicture.asset(
                  'login.svg',
                  height: widgetSize.getHeight(180, context),
                ),
                Text(
                  'School Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  title: const Text(
                    'Add Students',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 2;
                    });
                  },
                  title: const Text(
                    'Edit Students',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 3;
                    });
                  },
                  title: const Text(
                    'Show Students',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 4;
                    });
                  },
                  title: const Text(
                    'Add Teachers',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 5;
                    });
                  },
                  title: const Text(
                    'Edit Teachers',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    setState(() {
                      selectedTab = 6;
                    });
                  },
                  title: const Text(
                    'Show Teachers',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {},
                  title: const Text(
                    'Classes and Classrooms',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {},
                  title: const Text(
                    'Daily Schedule',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {},
                  title: const Text(
                    'Exam Schedule',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  onTap: () {},
                  title: const Text(
                    'Exams',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: IndexedStack(
            index: selectedTab,
            children: pages,
          ),
        ),
      ],
    ));
  }
}
