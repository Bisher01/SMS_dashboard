import 'package:flutter/material.dart';
import 'package:sms_dashboard/components/components.dart';
import '../screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}
int selectedTab = 0;
class _MainScreenState extends State<MainScreen> {

  List<Widget> pages = [
    AddStudent(),
    AddTeacher(),
    EditStudent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Row(
              children: [
                InkWell(onTap: (){
                  setState((){
                    selectedTab = 0;
                  });
                },child: Text('add stu')),
                InkWell(onTap: (){
                  setState((){
                    selectedTab = 1;
                  });
                },child: Text('add tesh')),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.access_alarm),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      // Show the bottom tab bar if screen width < 640
      body: IndexedStack(
        index: selectedTab,
        children: pages,
      )
    );
  }
}
