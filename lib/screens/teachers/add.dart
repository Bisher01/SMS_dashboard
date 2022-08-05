import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/providers/providers.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final townController = TextEditingController();

  final salaryController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  final FocusNode focusNode7 = FocusNode();

  String? genderDDV;
  String? religionDDV;
  String? gradeDDV;

  int? subjectDDV;
  int? classDDV;
  int? classroomDDV;

  int? selectedSubject=0;
  int? selectedClass=0;

  Map<int, int> classes = {};
  Map<int, int> subjects = {};

  String? picture;
  FilePickerResult? result;

  void selectFile() async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
    } catch (e) {}

    if (result != null && result!.files.isNotEmpty) {
      final fileBytes = result!.files.first.bytes;
      //final fileName = result!.files.first.name;
      picture = base64Encode(fileBytes!);
    }
  }

  @override
  initState() {
    //Provider.of<AppProvider>(context, listen: false).getSubjectClassClassroom();
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
    super.initState();
  }

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: const Color(0Xff2BC3BB),
                  colorScheme:
                      const ColorScheme.light(primary: Color(0Xff2BC3BB)),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            },
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
    return ListView(
      padding: const EdgeInsets.all(
        30,
      ),
      children: [
        const Center(
          child: Text(
            'Add Teacher',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Consumer<AppProvider>(
          builder: (context, provider, child) {
            if (provider.getSeedResponse != null) {
              switch (provider.getSeedResponse!.status) {
                case Status.LOADING:
                  return Container();
                case Status.COMPLETED:
                  return Column(
                    children: [
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
                      //joining date picture
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
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
                                  'Joining date',
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
                      //gender religion grade subject
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
                                  genderDDV = newValue ?? 'Gender';
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].genders!
                                  .map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.type,
                                  child: Text(e.type!),
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
                                  religionDDV = newValue ?? 'Religion';
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].religtions!
                                  .map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.name,
                                  child: Text(e.name!),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              hint: const Text(
                                'Grade',
                              ),
                              value: gradeDDV,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: const Color(
                                  0Xff2BC3BB,
                                ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  gradeDDV = newValue ?? 'Grade';
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].grades!
                                  .map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.name,
                                  child: Text(e.name!),
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
                    ],
                  );
                case Status.ERROR:
                  return Container();
                default:
                  return Container();
              }
            }
            return Container();
          },
        ),
        //subject class classroom
        Consumer<AppProvider>(
          builder: (context, provider, child) {
            if (provider.getSubjectClassClassroomResponse != null) {
              switch (provider.getSubjectClassClassroomResponse!.status) {
                case Status.LOADING:
                  return Container();
                case Status.COMPLETED:
                  {
                    for (int i = 0;
                        i <
                            provider.getSubjectClassClassroomResponse!.data!
                                .data!.length;
                        i++) {
                      subjects[provider.getSubjectClassClassroomResponse!.data!
                          .data![i].id!] = i;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton<int>(
                            hint: const Text(
                              'Subject',
                            ),
                            value: subjectDDV,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: const Color(
                                0Xff2BC3BB,
                              ),
                            ),
                            onChanged: (int? newValue) {
                              setState(() {
                                subjectDDV = newValue ?? 0;
                                selectedSubject = subjects[subjectDDV] ?? 0;
                                for (int i = 0;
                                i <
                                    provider.getSubjectClassClassroomResponse!.data!
                                        .data![selectedSubject!].classes!.length;
                                i++) {
                                  classes[provider.getSubjectClassClassroomResponse!.data!
                                      .data![selectedSubject!].classes![i].id!] = i;
                                }
                              });
                            },
                            items: provider
                                .getSubjectClassClassroomResponse!.data!.data!
                                .map((e) {
                              return DropdownMenuItem<int>(
                                value: e.id,
                                child: Text(e.name!),
                              );
                            }).toList(),
                          ),
                          DropdownButton<int>(
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
                            onChanged: (int? newValue) {
                              setState(() {
                                classDDV = newValue ?? 0;
                                selectedClass = classes[classDDV] ?? 0;
                              });
                            },
                            items: provider.getSubjectClassClassroomResponse!
                                .data!.data![selectedSubject!].classes!
                                .map((e) {
                              return DropdownMenuItem<int>(
                                value: e.id,
                                child: Text(e.name!),
                              );
                            }).toList(),
                          ),
                          DropdownButton<int>(
                            hint: const Text(
                              'Classroom',
                            ),
                            value: classroomDDV,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: const Color(
                                0Xff2BC3BB,
                              ),
                            ),
                            onChanged: (int? newValue) {
                              setState(() {
                                classroomDDV = newValue ?? 0;
                              });
                            },
                            items: provider
                                .getSubjectClassClassroomResponse!
                                .data!
                                .data![selectedSubject!]
                                .classes![selectedClass!]
                                .classroom!
                                .map((e) {
                              return DropdownMenuItem<int>(
                                value: e.id,
                                child: Text(e.name.toString()),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }

                case Status.ERROR:
                  return Container(child: Text('error'));
                default:
                  return Container();
              }
            }
            return Container();
          },
        ),
        //salary submit
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
                  focusNode: focusNode7,
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
                      color: focusNode7.hasFocus
                          ? const Color(
                              0Xff2BC3BB,
                            )
                          : Colors.black54,
                    ),
                    labelText: "Salary",
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
                  controller: salaryController,
                ),
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
                  child: const Text(
                    'Submit',
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
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
    super.dispose();
  }
}
