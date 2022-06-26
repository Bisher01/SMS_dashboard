import 'package:flutter/material.dart';
import 'package:sms_dashboard/utill/widget_size.dart';
import '../../components/components.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final townController = TextEditingController();

  final fatherController = TextEditingController();
  final motherController = TextEditingController();
  final pemailController = TextEditingController();
  final nationalController = TextEditingController();

  final phoneController = TextEditingController();
  final jobController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  final FocusNode focusNode7 = FocusNode();
  final FocusNode focusNode8 = FocusNode();
  final FocusNode focusNode9 = FocusNode();
  final FocusNode focusNode10 = FocusNode();

  final FocusNode focusNode11 = FocusNode();
  final FocusNode focusNode12 = FocusNode();

  String genderDDV = 'male';
  String nationalityDDV = 'male';
  String bloodDDV = 'male';
  String religionDDV = 'male';

  String gradeDDv = 'male';
  String classDDV = 'male';
  String classroomDDv = 'male';

  String mnationalityDDV = 'male';
  String fnationalityDDV = 'male';
  String fbloodDDV = 'male';
  String preligionDDV = 'male';
  String yearDDV = 'male';

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0Xff2BC3BB),
            colorScheme: const ColorScheme.light(primary: Color(0Xff2BC3BB)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
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
  initState() {
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
    focusNode3.addListener(() {
      setState(() {});
    });

    focusNode4.addListener(() {
      setState(() {});
    });
    focusNode5.addListener(() {
      setState(() {});
    });
    focusNode6.addListener(() {
      setState(() {});
    });

    focusNode7.addListener(() {
      setState(() {});
    });
    focusNode8.addListener(() {
      setState(() {});
    });
    focusNode9.addListener(() {
      setState(() {});
    });
    focusNode10.addListener(() {
      setState(() {});
    });
    focusNode11.addListener(() {
      setState(() {});
    });
    focusNode12.addListener(() {
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(
        30,
      ),
      scrollDirection: Axis.vertical,
      children: [
        const Center(
          child: Text(
            'Add Student',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        //fname lname email
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode1,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode1.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "First name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: fnameController,
                ),
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode2,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode2.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "Last name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: lnameController,
                ),
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode3,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode3.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "Email address",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: emailController,
                ),
              ),
            ],
          ),
        ),
        //gender religion nationality blood type
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DropdownButton<String>(
                hint: const Text(
                  'Gender',
                ),
                value: genderDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    genderDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Nationality',
                ),
                value: nationalityDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    nationalityDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Blood type',
                ),
                value: bloodDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    bloodDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Religion',
                ),
                value: religionDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    religionDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        //birthdate picture
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: widgetSize.getWidth(60, context),
                height: widgetSize.getHeight(100, context),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(
                      0Xff2BC3BB,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: const Text(
                    'Date of birth',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'add picture',
                  style: TextStyle(
                    color: Color(
                      0Xff2BC3BB,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // grade class classroom academic year
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                hint: const Text(
                  'Grade',
                ),
                value: gradeDDv,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    gradeDDv = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Class',
                ),
                value: classDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    classDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Classroom',
                ),
                value: classroomDDv,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    classroomDDv = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text(
                  'Academic Year',
                ),
                value: yearDDV,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: const Color(
                    0Xff2BC3BB,
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    yearDDV = newValue!;
                  });
                },
                items: <String>['male', 'female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        //address
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode4,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode4.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "City",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: cityController,
                ),
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode5,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode5.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "Town",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: townController,
                ),
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode6,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode6.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "Street",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: streetController,
                ),
              ),
            ],
          ),
        ),
        //parents national number
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Parents national number',
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                child: TextFormField(
                  focusNode: focusNode10,
                  cursorColor: const Color(
                    0Xff2BC3BB,
                  ),
                  decoration: InputDecoration(
                    hoverColor: const Color(
                      0Xff2BC3BB,
                    ),
                    focusColor: const Color(
                      0Xff2BC3BB,
                    ),
                    labelStyle: TextStyle(
                      color: focusNode10.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "National number",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: const BorderSide(
                        color: Color(0Xff2BC3BB),
                        width: 1,
                      ),
                    ),
                  ),
                  controller: nationalController,
                ),
              ),
            ],
          ),
        ),
        //submit
        Padding(
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: widgetSize.getWidth(
                  70,
                  context,
                ),
                height: widgetSize.getHeight(
                  60,
                  context,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(
                      0Xff2BC3BB,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                  child: Text(
                    'Submit',
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        //parents
        //mother father email
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 30,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //         width: widgetSize.getWidth(
        //           70,
        //           context,
        //         ),
        //         child: TextFormField(
        //           focusNode: focusNode7,
        //           cursorColor: const Color(
        //             0Xff2BC3BB,
        //           ),
        //           decoration: InputDecoration(
        //             hoverColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             focusColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             labelStyle: TextStyle(
        //               color: focusNode7.hasFocus
        //                   ? const Color(
        //                       0Xff2BC3BB,
        //                     )
        //                   : Colors.black54,
        //             ),
        //             labelText: "Father name",
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 2,
        //               ),
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           controller: fatherController,
        //         ),
        //       ),
        //       SizedBox(
        //         width: widgetSize.getWidth(
        //           70,
        //           context,
        //         ),
        //         child: TextFormField(
        //           focusNode: focusNode8,
        //           cursorColor: const Color(
        //             0Xff2BC3BB,
        //           ),
        //           decoration: InputDecoration(
        //             hoverColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             focusColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             labelStyle: TextStyle(
        //               color: focusNode8.hasFocus
        //                   ? const Color(
        //                       0Xff2BC3BB,
        //                     )
        //                   : Colors.black54,
        //             ),
        //             labelText: "Mother name",
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 2,
        //               ),
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           controller: motherController,
        //         ),
        //       ),
        //       SizedBox(
        //         width: widgetSize.getWidth(
        //           70,
        //           context,
        //         ),
        //         child: TextFormField(
        //           focusNode: focusNode9,
        //           cursorColor: const Color(
        //             0Xff2BC3BB,
        //           ),
        //           decoration: InputDecoration(
        //             hoverColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             focusColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             labelStyle: TextStyle(
        //               color: focusNode9.hasFocus
        //                   ? const Color(
        //                       0Xff2BC3BB,
        //                     )
        //                   : Colors.black54,
        //             ),
        //             labelText: "Parent email address",
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 2,
        //               ),
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           controller: pemailController,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        //job and phone
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: 30,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //         width: widgetSize.getWidth(
        //           70,
        //           context,
        //         ),
        //         child: TextFormField(
        //           focusNode: focusNode11,
        //           cursorColor: const Color(
        //             0Xff2BC3BB,
        //           ),
        //           decoration: InputDecoration(
        //             hoverColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             focusColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             labelStyle: TextStyle(
        //               color: focusNode11.hasFocus
        //                   ? const Color(
        //                 0Xff2BC3BB,
        //               )
        //                   : Colors.black54,
        //             ),
        //             labelText: "Phone number",
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 2,
        //               ),
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           controller: phoneController,
        //         ),
        //       ),
        //       SizedBox(
        //         width: widgetSize.getWidth(
        //           70,
        //           context,
        //         ),
        //         child: TextFormField(
        //           focusNode: focusNode12,
        //           cursorColor: const Color(
        //             0Xff2BC3BB,
        //           ),
        //           decoration: InputDecoration(
        //             hoverColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             focusColor: const Color(
        //               0Xff2BC3BB,
        //             ),
        //             labelStyle: TextStyle(
        //               color: focusNode12.hasFocus
        //                   ? const Color(
        //                 0Xff2BC3BB,
        //               )
        //                   : Colors.black54,
        //             ),
        //             labelText: "Job",
        //             focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 2,
        //               ),
        //             ),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(
        //                 10,
        //               ),
        //               borderSide: const BorderSide(
        //                 color: Color(0Xff2BC3BB),
        //                 width: 1,
        //               ),
        //             ),
        //           ),
        //           controller: jobController,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // //blood religion nationality
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 30.0,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: <Widget>[
        //       DropdownButton<String>(
        //         hint: const Text(
        //           'Mother nationality',
        //         ),
        //         value: mnationalityDDV,
        //         elevation: 16,
        //         underline: Container(
        //           height: 2,
        //           color: const Color(
        //             0Xff2BC3BB,
        //           ),
        //         ),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             mnationalityDDV = newValue!;
        //           });
        //         },
        //         items: <String>['male', 'female']
        //             .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //       DropdownButton<String>(
        //         hint: const Text(
        //           'Father nationality',
        //         ),
        //         value: fnationalityDDV,
        //         elevation: 16,
        //         underline: Container(
        //           height: 2,
        //           color: const Color(
        //             0Xff2BC3BB,
        //           ),
        //         ),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             fnationalityDDV = newValue!;
        //           });
        //         },
        //         items: <String>['male', 'female']
        //             .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //       DropdownButton<String>(
        //         hint: const Text(
        //           'Father blood type',
        //         ),
        //         value: fbloodDDV,
        //         elevation: 16,
        //         underline: Container(
        //           height: 2,
        //           color: const Color(
        //             0Xff2BC3BB,
        //           ),
        //         ),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             fbloodDDV = newValue!;
        //           });
        //         },
        //         items: <String>['male', 'female']
        //             .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //       DropdownButton<String>(
        //         hint: const Text(
        //           'Parents religion',
        //         ),
        //         value: preligionDDV,
        //         elevation: 16,
        //         underline: Container(
        //           height: 2,
        //           color: const Color(
        //             0Xff2BC3BB,
        //           ),
        //         ),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             preligionDDV = newValue!;
        //           });
        //         },
        //         items: <String>['male', 'female']
        //             .map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
  @override
  dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    focusNode7.dispose();
    focusNode8.dispose();
    focusNode9.dispose();
    focusNode10.dispose();
    focusNode11.dispose();
    focusNode12.dispose();
    super.dispose();
  }
}
