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

int selectedTab = 1;

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  bool isOpened = true;
  double studentCardHeight = 0;
  double teacherCardHeight = 0;
  double mentorsCardHeight = 0;

  List<Widget> pages = [
    const Settings(),
    AddStudent(
      onAdd: (student) {},
      onEdit: (student) {},
    ),
    const ShowStudent(),
    const AddTeacher(),
    const ShowTeacher(),
    AddMentor(
      onAdd: (mentor) {},
      onEdit: (mentor) {},
    ),
    const ShowMentor(),
    const ShowSyllabi(),
    AddSubject(onEdit: (subject) {}, onAdd: (subject) {}),
    AddClassroom(onEdit: (classroom) {}, onAdd: (classroom) {}),
    ShowExams(),
  ];

  @override
  void initState() {
    Provider.of<AppProvider>(context,listen: false).getSeed();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                    SvgPicture.asset(
                      'login.svg',
                      height: widgetSize.getHeight(180, context),
                    ),
                    const Text(
                      'School Name',
                      style: TextStyle(
                        //color: ColorResources.green,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (studentCardHeight == 0) {
                              studentCardHeight = 85;
                              teacherCardHeight = 0;
                              mentorsCardHeight = 0;
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
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 2, left: 10),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: AnimatedSmoothIndicator(
                                  count: 2,
                                  effect: WormEffect(
                                    activeDotColor: ColorResources.green,
                                    dotColor: Colors.grey[600]!,
                                    paintStyle: PaintingStyle.fill,
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    spacing: 25,
                                  ),
                                  activeIndex: selectedTab - 1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              children: [
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    width: 250,
                                    child: Text(
                                      'Add Students',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: selectedTab == 1
                                            ? ColorResources.green
                                            : Colors.grey[600],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 1;
                                    });
                                  },
                                ),
                                InkWell(
                                  child: SizedBox(
                                    width: 250,
                                    child: Text(
                                      'Show Students',
                                      style: TextStyle(
                                        color: selectedTab == 2
                                            ? ColorResources.green
                                            : Colors.grey[600],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 2;
                                      Provider.of<AppProvider>(context, listen: false).getAllStudents();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: ColorResources.green,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (teacherCardHeight == 0) {
                              teacherCardHeight = 85;
                              studentCardHeight = 0;
                              mentorsCardHeight = 0;
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
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[600],
                                  radius: 6,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[600],
                                  radius: 6,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              children: [
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    width: 250,
                                    child: Text(
                                      'Add Teachers',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: selectedTab == 3
                                            ? ColorResources.green
                                            : Colors.grey[600],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 3;
                                      Provider.of<AppProvider>(context, listen: false).getSubjectClassClassroom();
                                    });
                                  },
                                ),
                                InkWell(
                                  child: SizedBox(
                                    width: 250,
                                    child: Text(
                                      'Show Teachers',
                                      style: TextStyle(
                                        color: selectedTab == 4
                                            ? ColorResources.green
                                            : Colors.grey[600],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 4;
                                      Provider.of<AppProvider>(context, listen: false).getAllTeachers();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                      color: ColorResources.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (mentorsCardHeight == 0) {
                              mentorsCardHeight = 85;
                              studentCardHeight = 0;
                              teacherCardHeight = 0;
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
                                  color: selectedTab == 5
                                      ? ColorResources.green
                                      : Colors.grey[600],
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = 5;
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
                                  color: selectedTab == 6
                                      ? ColorResources.green
                                      : Colors.grey[600],
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = 6;
                                Provider.of<AppProvider>(context, listen: false).getAllMentors();
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
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      onTap: () {
                        setState(() {
                          selectedTab = 8;
                        });
                      },
                      title: const Text(
                        'Subjects',
                        style: TextStyle(
                          //color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
                      height: 0,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      onTap: () {
                        setState(() {
                          selectedTab = 9;
                        });
                      },
                      title: const Text(
                        'Classrooms',
                        style: TextStyle(
                          //color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      onTap: () {},
                      title: const Text(
                        'Daily Schedule',
                        style: TextStyle(
                          // color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      onTap: () {
                        setState((){selectedTab=10;});
                        Provider.of<AppProvider>(context,listen: false).getAllExams();
                      },
                      title: const Text(
                        'Exams',
                        style: TextStyle(
                          //color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
                    ),
                    // ListTile(
                    //   leading: const Icon(
                    //     Icons.ac_unit,
                    //     //color: Colors.white,
                    //     color: ColorResources.green,
                    //   ),
                    //   onTap: () {},
                    //   title: const Text(
                    //     'Exams',
                    //     style: TextStyle(
                    //       //color: Colors.white,
                    //       color: ColorResources.green,
                    //     ),
                    //   ),
                    // ),
                    // const Divider(
                    //   //color: Colors.white,
                    //   color: ColorResources.green,
                    // ),
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      onTap: () {
                        setState(() {
                          selectedTab = 7;
                          Provider.of<AppProvider>(context,listen: false).getSyllabi();
                        });
                      },
                      title: const Text(
                        'Syllabi',
                        style: TextStyle(
                          //color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.ac_unit,
                        //color: Colors.white,
                        color: ColorResources.green,
                      ),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          //color: Colors.white,
                          color: ColorResources.green,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                    ),
                    const Divider(
                      //color: Colors.white,
                      color: ColorResources.green,
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
                  index: selectedTab,
                  children: pages,
                ),
              ),
            ),
          ],
        ));
  }
}
