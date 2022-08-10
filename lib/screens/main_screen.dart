import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sms_dashboard/providers/providers.dart';
import '../utill/utill.dart';
import '../screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  bool isOpened = true;
  double studentCardHeight = 0;
  double teacherCardHeight = 0;
  double mentorsCardHeight = 0;
  double subjectsCardHeight = 0;
  double classesCardHeight = 0;

  List<Widget> pages = [];

  @override
  void initState() {
    Provider.of<AppProvider>(context, listen: false).getSeed();
    pages = [
      const Settings(),
      AddStudent(
        student: Provider.of<TabManager>(context, listen: false).student,
      ),
      const ShowStudent(),
      const AddTeacher(),
      const ShowTeacher(),
      const AddMentor(),
      const ShowMentor(),
      const ShowSyllabi(),
      AddSubject(onEdit: (subject) {}, onAdd: (subject) {}),
      AddClassroom(onEdit: (classroom) {}, onAdd: (classroom) {}),
      const ShowExams(),
      const TimeTable(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Sherlock School',
                style: TextStyle(
                  //color: ColorResources.green,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              centerTitle: false,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  //color: ColorResources.green,
                ),
              ),
              //backgroundColor: Colors.white,
              backgroundColor: ColorResources.green,
            ),
            body: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  width: 250,
                  color: Colors.white,
                  // color: ColorResources.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      controller: ScrollController(),
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        Image.asset('college.png',height: 200,),
                        //student==================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (studentCardHeight == 0) {
                                  studentCardHeight = 85;
                                  teacherCardHeight = 0;
                                  mentorsCardHeight = 0;
                                  classesCardHeight = 0;
                                  subjectsCardHeight = 0;
                                } else {
                                  studentCardHeight = 0;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'student.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Students',
                                  style: TextStyle(
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorResources.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: studentCardHeight,
                          child: ListView(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 42, top: 15),
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  width: 250,
                                  child: Text(
                                    'Add Students',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: provider.selectedTab == 1
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(1);
                                  });
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Show Students',
                                    style: TextStyle(
                                      color: provider.selectedTab == 2
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(2);
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .getAllStudents();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: ColorResources.green,
                          height: 0,
                        ),
                        //teacher==================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (teacherCardHeight == 0) {
                                  teacherCardHeight = 85;
                                  studentCardHeight = 0;
                                  mentorsCardHeight = 0;
                                  classesCardHeight = 0;
                                  subjectsCardHeight = 0;
                                } else {
                                  teacherCardHeight = 0;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'teacher.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Teachers',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorResources.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: teacherCardHeight,
                          child: ListView(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 42, top: 15),
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  width: 250,
                                  child: Text(
                                    'Add Teachers',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: provider.selectedTab == 3
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(3);
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .getSubjectClassClassroom();
                                  });
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Show Teachers',
                                    style: TextStyle(
                                      color: provider.selectedTab == 4
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(4);
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .getAllTeachers();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                          color: ColorResources.green,
                        ),
                        //mentor==================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (mentorsCardHeight == 0) {
                                  mentorsCardHeight = 85;
                                  studentCardHeight = 0;
                                  teacherCardHeight = 0;
                                  subjectsCardHeight = 0 ;
                                  classesCardHeight = 0;
                                } else {
                                  mentorsCardHeight = 0;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'mentor.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Mentors',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorResources.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: mentorsCardHeight,
                          child: ListView(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 42, top: 15),
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  width: 250,
                                  child: Text(
                                    'Add Mentors',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: provider.selectedTab == 5
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(5);
                                  });
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Show Mentors',
                                    style: TextStyle(
                                      //color: Colors.white,
                                      color: provider.selectedTab == 6
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(6);
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .getAllMentors();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          //color: Colors.white,
                          color: ColorResources.green,
                          height: 0,
                        ),

                        //classes===================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (classesCardHeight == 0) {
                                  classesCardHeight = 85;
                                  studentCardHeight = 0;
                                  teacherCardHeight = 0;
                                  subjectsCardHeight=0;
                                  mentorsCardHeight=0;
                                } else {
                                  classesCardHeight = 0;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'classroom.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Classes',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorResources.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: classesCardHeight,
                          child: ListView(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 42, top: 15),
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  width: 250,
                                  child: Text(
                                    'Add Classroom',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: provider.selectedTab == 9
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(9);
                                  });
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Daily Schedule',
                                    style: TextStyle(
                                      //color: Colors.white,
                                      color: provider.selectedTab == 11
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(11);
                                    Provider.of<AppProvider>(context,
                                            listen: false)
                                        .getAllMentors();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          //color: Colors.white,
                          color: ColorResources.green,
                          height: 0,
                        ),
                        //subjects==================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (subjectsCardHeight == 0) {
                                  subjectsCardHeight = 85;
                                  studentCardHeight = 0;
                                  teacherCardHeight = 0;
                                  mentorsCardHeight = 0;
                                  classesCardHeight = 0;
                                } else {
                                  subjectsCardHeight = 0;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'book-stack.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Subjects',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorResources.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                          indent: 40,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: subjectsCardHeight,
                          child: ListView(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 42, top: 15),
                            children: [
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  width: 250,
                                  child: Text(
                                    'Add subject',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: provider.selectedTab == 8
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(8);
                                  });
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Show syllabi',
                                    style: TextStyle(
                                      //color: Colors.white,
                                      color: provider.selectedTab == 7
                                          ? ColorResources.green
                                          : Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    provider.goToTab(7);
                                    Provider.of<AppProvider>(context,
                                        listen: false)
                                        .getSyllabi();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          //color: Colors.white,
                          color: ColorResources.green,
                          height: 0,
                        ),
                        //exams=====================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                provider.goToTab(10);
                              });
                              Provider.of<AppProvider>(context, listen: false)
                                  .getAllExams();
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'test.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Exams',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.double_arrow_rounded,
                                  color: ColorResources.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          //color: Colors.white,
                          color: ColorResources.green,
                          height: 0,
                        ),
                        //settings==================================
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                provider.goToTab(0);
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'settings.png',
                                  height: 35,
                                  color: ColorResources.green,
                                ),
                                const Text(
                                  ' Settings',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    color: ColorResources.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.double_arrow_rounded,
                                  color: ColorResources.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          //color: Colors.white,
                          color: ColorResources.green,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[200],
                    width: isOpened
                        ? MediaQuery.of(context).size.width - 250
                        : MediaQuery.of(context).size.width,
                    child: IndexedStack(
                      index: provider.selectedTab,
                      children: pages,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
