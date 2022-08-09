import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/providers/providers.dart';

import '../../models/models.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';

class AddMentor extends StatefulWidget {
  final Mentor? mentor;
  final bool isEditing;

  const AddMentor({
    Key? key,
    this.mentor,
  })  : isEditing = (mentor != null),
        super(key: key);

  @override
  State<AddMentor> createState() => _AddMentorState();
}

class _AddMentorState extends State<AddMentor> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final townController = TextEditingController();

  final phoneController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  final FocusNode focusNode7 = FocusNode();

  int? classDDV;

  @override
  initState() {
    //Provider.of<AppProvider>(context, listen: false).getSeed();
    final mentor = widget.mentor;
    if (mentor != null) {
      fnameController.text = mentor.f_name!;
      lnameController.text = mentor.l_name!;
      emailController.text = mentor.email!;
      streetController.text = mentor.address!.street!;
      cityController.text = mentor.address!.city!;
      townController.text = mentor.address!.town!;
      phoneController.text = mentor.phone!;
      classDDV = mentor.class_id!;
      _selectedDate = mentor.joining_date!;
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
    super.initState();
  }

  String? _selectedDate;

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
        _selectedDate =
            '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      });
    });
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
              padding: const EdgeInsets.all(
                30,
              ),
              children: [
                const Center(
                  child: Text(
                    'Add Mentor',
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
                //joining date class
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
                        items: provider.getSeedResponse!.data!.data![0].classes!
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
                // phone submit
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
                            labelText: "Phone",
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
                            final provider = Provider.of<AppProvider>(context,
                                listen: false);
                            if (await provider.checkInternet()) {
                              if (widget.isEditing) {
                                var response = await provider.editMentor(
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  city: cityController.text,
                                  town: townController.text,
                                  street: streetController.text,
                                  lName: lnameController.text,
                                  fName: fnameController.text,
                                  joiningDate: _selectedDate!,
                                  classId: classDDV!,
                                  id: widget.mentor!.id!,
                                );
                                if (response.status == Status.LOADING) {
                                  EasyLoading.showToast(
                                    'Loading...',
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                  );
                                }
                                if (response.status == Status.ERROR) {
                                  EasyLoading.showError(response.message!,
                                      dismissOnTap: true);
                                }
                                if (response.status == Status.COMPLETED) {
                                  if (response.data != null &&
                                      response.data!.status!) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                Text(response.data!.message!),
                                            content: Text(
                                              'The code is: ${response.data!.mentor![0].code}',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    classDDV = null;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Color(
                                                    0Xff2BC3BB,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                    fnameController.clear();
                                    lnameController.clear();
                                    emailController.clear();
                                    streetController.clear();
                                    cityController.clear();
                                    townController.clear();
                                    phoneController.clear();
                                  }
                                }
                              } else {
                                var response = await provider.addMentor(
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  city: cityController.text,
                                  town: townController.text,
                                  street: streetController.text,
                                  lName: lnameController.text,
                                  fName: fnameController.text,
                                  joiningDate: _selectedDate!,
                                  classId: classDDV!,
                                );
                                if (response.status == Status.LOADING) {
                                  EasyLoading.showToast(
                                    'Loading...',
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                  );
                                }
                                if (response.status == Status.ERROR) {
                                  EasyLoading.showError(response.message!,
                                      dismissOnTap: true);
                                }
                                if (response.status == Status.COMPLETED) {
                                  if (response.data != null &&
                                      response.data!.status!) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                Text(response.data!.message!),
                                            content: Text(
                                              'The code is: ${response.data!.mentor![0].code}',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    classDDV = null;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Color(
                                                    0Xff2BC3BB,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                    fnameController.clear();
                                    lnameController.clear();
                                    emailController.clear();
                                    streetController.clear();
                                    cityController.clear();
                                    townController.clear();
                                    phoneController.clear();
                                  }
                                }
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
    super.dispose();
  }
}
