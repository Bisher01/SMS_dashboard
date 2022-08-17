import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/utill/widget_size.dart';
import '../models/models.dart';
import '../providers/app_provider.dart';
import '../services/api_response.dart';

class SettingsCard extends StatefulWidget {
  final Color color;
  final String title;
  final String name;
  final String? button;
  final Settings? settings;
  const SettingsCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.name,
      required this.settings,
      this.button})
      : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final townController = TextEditingController();

  final oldController = TextEditingController();
  final newController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  final FocusNode focusNode7 = FocusNode();
  final FocusNode focusNode8 = FocusNode();

  String? picture;

  FilePickerResult? result;
  void selectFile() async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (result != null && result!.files.isNotEmpty) {
      final fileBytes = result!.files.first.bytes;
      final fileName = result!.files.first.name;
      picture = base64Encode(fileBytes!);
    }
  }

  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.color),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          if (widget.button != null)
            TextButton(
              onPressed: () {
                nameController.text = widget.settings!.name!;
                phoneController.text = widget.settings!.phone!;
                emailController.text = widget.settings!.admin!.email!;
                streetController.text = widget.settings!.address!.street!;
                cityController.text = widget.settings!.address!.city!;
                townController.text = widget.settings!.address!.town!;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Edit Settings',
                        ),
                        content: SizedBox(
                          width: widgetSize.getWidth(300, context),
                          height: widgetSize.getHeight(500, context),
                          child: Card(
                            child: ListView(
                              controller: ScrollController(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            labelText: "Name",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          controller: nameController,
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
                                            labelText: "Email",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                            labelText: "Phone",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            labelText: "Old password",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          controller: oldController,
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
                                            labelText: "New password",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              borderSide: const BorderSide(
                                                color: Color(0Xff2BC3BB),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          controller: newController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: SizedBox(
                                    width: widgetSize.getWidth(
                                      70,
                                      context,
                                    ),
                                    child: TextButton(onPressed: (){
                                      selectFile();
                                    },child: Text('add picture'),),
                                  ),
                                ),
                              //picture
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(),
                                          onPressed: () async {
                                            final provider =
                                                Provider.of<AppProvider>(
                                                    context,
                                                    listen: false);
                                            if (await provider
                                                .checkInternet()) {
                                              var response = oldController ==
                                                          null ||
                                                      oldController
                                                          .text.isEmpty ||
                                                      oldController.text ==
                                                          '' ||
                                                      newController == null ||
                                                      newController
                                                          .text.isEmpty ||
                                                      newController.text == ''
                                                  ? await provider.editSettings(
                                                      phoneController.text,
                                                      nameController.text,
                                                      "test",
                                                      cityController.text,
                                                      townController.text,
                                                      streetController.text,
                                                      emailController.text,
                                                      picture:picture)
                                                  : await provider.editSettings(
                                                      phoneController.text,
                                                      nameController.text,
                                                      "test",
                                                      cityController.text,
                                                      townController.text,
                                                      streetController.text,
                                                      emailController.text,
                                                      oldP: oldController.text,
                                                      newP: newController.text,
                                              picture: picture);
                                              if (response.status ==
                                                  Status.LOADING) {
                                                EasyLoading.showToast(
                                                  'Loading...',
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                              }
                                              if (response.status ==
                                                  Status.ERROR) {
                                                EasyLoading.showError(
                                                    response.message!,
                                                    dismissOnTap: true);
                                              }
                                              if (response.status ==
                                                  Status.COMPLETED) {
                                                if (response.data != null) {
                                                  EasyLoading.showSuccess(
                                                    'Success',
                                                  );
                                                  nameController.clear();
                                                  emailController.clear();
                                                  streetController.clear();
                                                  cityController.clear();
                                                  townController.clear();
                                                  phoneController.clear();
                                                  oldController.clear();
                                                  newController.clear();
                                                  provider.getSettings();
                                                }
                                              }
                                            }
                                          },
                                          child: Text('Submit')),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                widget.button!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  dispose() {
    // focusNode1.dispose();
    // focusNode2.dispose();
    // focusNode3.dispose();
    // focusNode4.dispose();
    // focusNode5.dispose();
    // focusNode6.dispose();
    // focusNode7.dispose();
    // focusNode8.dispose();
    // focusNode9.dispose();
    // focusNode10.dispose();

    super.dispose();
  }
}
