import 'package:flutter/material.dart';
import '../../components/components.dart';
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

  String genderDDV = 'male';
  String religionDDV = 'male';
  String gradeDDV = 'male';

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
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: widgetSize.getWidth(60, context),
                height: widgetSize.getHeight(100, context),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(
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
                hint: Text(
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
                hint: Text(
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
              DropdownButton<String>(
                hint: Text(
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
                    gradeDDV = newValue!;
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
        //salary submit
        Padding(
          padding: EdgeInsets.only(
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
                  child: Text(
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
