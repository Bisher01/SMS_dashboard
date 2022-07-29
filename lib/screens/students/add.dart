import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/models/models.dart';
import 'package:sms_dashboard/providers/providers.dart';
import 'package:sms_dashboard/utill/widget_size.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../services/api_response.dart';

class AddStudent extends StatefulWidget {
  final Function(Student) onAdd;
  final Function(Student) onEdit;
  final Student? student;
  final bool isEditing;

  const AddStudent({
    Key? key,
    required this.onEdit,
    required this.onAdd,
    this.student,
  })  : isEditing = (student != null),
        super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  bool isParent = true;
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

  int? genderDDV;
  int? nationalityDDV;
  int? bloodDDV;
  int? religionDDV;

  int? gradeDDv;
  int? classDDV;
  int? classroomDDv;
  int? mnationalityDDV;
  int? fnationalityDDV;
  int? fbloodDDV;
  int? preligionDDV;
  int? yearDDV;

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
    Provider.of<AppProvider>(context, listen: false).getSeed();
    final student = widget.student;
    if (student != null) {
      fnameController.text = student.f_name!;
      lnameController.text = student.l_name!;
      emailController.text = student.email!;
      streetController.text = student.address!.street!;
      cityController.text = student.address!.city!;
      townController.text = student.address!.town!;
      fatherController.text = student.parent!.father_name!;
      motherController.text = student.parent!.mother_name!;
      pemailController.text = student.parent!.email!;
      nationalController.text = student.parent!.national_number!;
      phoneController.text = student.parent!.phone!;
      jobController.text = student.parent!.jop!;
    }
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

  File? image;
  Future pickImage() async {
    try {
      final imagee = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagee == null) return;
      final imageTemp = File(await imagee.readAsBytes(), 'im');
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.getSeedResponse != null) {
        switch (provider.getSeedResponse!.status) {
          case Status.LOADING:
            return const Center(child: Text('loading'));
          case Status.COMPLETED:
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
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              genderDDV = newValue ?? 0;
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].genders!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.type!),
                            );
                          }).toList()),
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              nationalityDDV = newValue ?? 0;
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].nationality!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            );
                          }).toList()),
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              bloodDDV = newValue ?? 0;
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].bloods!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.type!),
                            );
                          }).toList()),
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              religionDDV = newValue ?? 0;
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].religtions!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            );
                          }).toList()),
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
                        onPressed: () async {
                          pickImage();
                        },
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
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              gradeDDv = newValue ?? 0;
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].grades!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            );
                          }).toList()),
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
                            });
                          },
                          items: provider
                              .getSeedResponse!.data!.data![0].classes!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            );
                          }).toList()),
                      DropdownButton<int>(
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
                          onChanged: (int? newValue) {
                            setState(() {
                              classroomDDv = newValue ?? 0;
                            });
                          },
                          items: provider.getSeedResponse!.data!.data![0]
                              .classes![(classDDV ?? 1) - 1].classroom!
                              .map((e) {
                            return DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name!),
                            );
                          }).toList()),
                      DropdownButton<int>(
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
                        onChanged: (int? newValue) {
                          setState(() {
                            yearDDV = newValue ?? 0;
                          });
                        },
                        items: provider
                            .getSeedResponse!.data!.data![0].academicYears!
                            .map((e) {
                          return DropdownMenuItem<int>(
                            value: e.id,
                            child: Text(e.date!),
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

                //parents
                //mother father email
                isParent
                    ? const SizedBox()
                    : Padding(
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
                                  labelText: "Father name",
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
                                controller: fatherController,
                              ),
                            ),
                            SizedBox(
                              width: widgetSize.getWidth(
                                70,
                                context,
                              ),
                              child: TextFormField(
                                focusNode: focusNode8,
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
                                    color: focusNode8.hasFocus
                                        ? const Color(
                                            0Xff2BC3BB,
                                          )
                                        : Colors.black54,
                                  ),
                                  labelText: "Mother name",
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
                                controller: motherController,
                              ),
                            ),
                            SizedBox(
                              width: widgetSize.getWidth(
                                70,
                                context,
                              ),
                              child: TextFormField(
                                focusNode: focusNode9,
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
                                    color: focusNode9.hasFocus
                                        ? const Color(
                                            0Xff2BC3BB,
                                          )
                                        : Colors.black54,
                                  ),
                                  labelText: "Parent email address",
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
                                controller: pemailController,
                              ),
                            ),
                          ],
                        ),
                      ),

                //job and phone
                isParent
                    ? const SizedBox()
                    : Padding(
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
                                focusNode: focusNode11,
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
                                    color: focusNode11.hasFocus
                                        ? const Color(
                                            0Xff2BC3BB,
                                          )
                                        : Colors.black54,
                                  ),
                                  labelText: "Phone number",
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
                                controller: phoneController,
                              ),
                            ),
                            SizedBox(
                              width: widgetSize.getWidth(
                                70,
                                context,
                              ),
                              child: TextFormField(
                                focusNode: focusNode12,
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
                                    color: focusNode12.hasFocus
                                        ? const Color(
                                            0Xff2BC3BB,
                                          )
                                        : Colors.black54,
                                  ),
                                  labelText: "Job",
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
                                controller: jobController,
                              ),
                            ),
                          ],
                        ),
                      ),

                //blood religion nationality
                isParent
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DropdownButton<int>(
                                hint: const Text(
                                  'Mother nationality',
                                ),
                                value: mnationalityDDV,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: const Color(
                                    0Xff2BC3BB,
                                  ),
                                ),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    mnationalityDDV = newValue ?? 0;
                                  });
                                },
                                items: provider.getSeedResponse!.data!.data![0]
                                    .nationality!
                                    .map((e) {
                                  return DropdownMenuItem<int>(
                                    value: e.id,
                                    child: Text(e.name!),
                                  );
                                }).toList()),
                            DropdownButton<int>(
                              hint: const Text(
                                'Father nationality',
                              ),
                              value: fnationalityDDV,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: const Color(
                                  0Xff2BC3BB,
                                ),
                              ),
                              onChanged: (int? newValue) {
                                setState(() {
                                  fnationalityDDV = newValue ?? 0;
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].nationality!
                                  .map((e) {
                                return DropdownMenuItem<int>(
                                  value: e.id,
                                  child: Text(e.name!),
                                );
                              }).toList(),
                            ),
                            DropdownButton<int>(
                              hint: const Text(
                                'Father blood type',
                              ),
                              value: fbloodDDV,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: const Color(
                                  0Xff2BC3BB,
                                ),
                              ),
                              onChanged: (int? newValue) {
                                setState(() {
                                  fbloodDDV = newValue ?? 0;
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].bloods!
                                  .map((e) {
                                return DropdownMenuItem<int>(
                                  value: e.id,
                                  child: Text(e.type!),
                                );
                              }).toList(),
                            ),
                            DropdownButton<int>(
                              hint: const Text(
                                'Parents religion',
                              ),
                              value: preligionDDV,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: const Color(
                                  0Xff2BC3BB,
                                ),
                              ),
                              onChanged: (int? newValue) {
                                setState(() {
                                  preligionDDV = newValue ?? 0;
                                });
                              },
                              items: provider
                                  .getSeedResponse!.data!.data![0].religtions!
                                  .map((e) {
                                return DropdownMenuItem<int>(
                                  value: e.id,
                                  child: Text(e.name!),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                //submit
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
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
                          child: const Text(
                            'Submit',
                          ),
                          onPressed: () async {
                            if (isParent) {
                              try {
                                var res = await Provider.of<AppProvider>(
                                        context,
                                        listen: false)
                                    .addStudent(
                                        picture: image!,
                                        email: emailController.text,
                                        f_name: fnameController.text,
                                        l_name: lnameController.text,
                                        nationality: nationalityDDV!,
                                        birthdate: _selectedDate!,
                                        blood_id: bloodDDV!,
                                        gender_id: genderDDV!,
                                        religion_id: religionDDV!,
                                        grade_id: gradeDDv!,
                                        class_id: classDDV!,
                                        classroom_id: classroomDDv!,
                                        academic_year_id: yearDDV!,
                                        national_number:
                                            nationalController.text,
                                        city: cityController.text,
                                        town: townController.text,
                                        street: streetController.text);
                                if (res.data != null) {
                                  if (res.data!.status!) {
                                    print('added');
                                  } else {
                                    setState(() {
                                      isParent = false;
                                    });
                                  }
                                }
                              } catch (e) {
                                setState(() {
                                  isParent = false;
                                });
                              }
                            } else {
                              try {
                                var res = await Provider.of<AppProvider>(
                                        context,
                                        listen: false)
                                    .addStudentWithParent(
                                        picture: image!,
                                        email: emailController.text,
                                        f_name: fnameController.text,
                                        l_name: lnameController.text,
                                        nationality: nationalityDDV!,
                                        birthdate: _selectedDate!,
                                        blood_id: bloodDDV!,
                                        gender_id: genderDDV!,
                                        religion_id: religionDDV!,
                                        grade_id: gradeDDv!,
                                        class_id: classDDV!,
                                        classroom_id: classroomDDv!,
                                        academic_year_id: yearDDV!,
                                        mother_name: motherController.text,
                                        father_name: fatherController.text,
                                        parentEmail: pemailController.text,
                                        parentJop: jobController.text,
                                        parentPhone: phoneController.text,
                                        national_number:
                                            nationalController.text,
                                        city: cityController.text,
                                        town: townController.text,
                                        street: streetController.text);
                                if (res.data != null) {
                                  if (res.data!.status!) {
                                    print('added');
                                  } else {
                                    print('not add');
                                  }
                                }
                              } catch (e) {
                                print('here');
                                print(e);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          case Status.ERROR:
            return Center(
                child: Text(provider.getSeedResponse!.message!.toString()));
          default:
            return const Center(child: Text('def'));
        }
      }
      return const Center(child: Text('else'));
    });
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
