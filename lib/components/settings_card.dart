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
                phoneController.text = widget.settings!.name!;
                emailController.text = widget.settings!.name!;
                streetController.text = widget.settings!.address!.street!;
                cityController.text = widget.settings!.address!.city!;
                townController.text = widget.settings!.address!.town!;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
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
                                                      picture:
                                                          'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAACAASURBVHic7d13gBPV4vbx5yS7bKPsLh2kqBRRsYEVsYEFsYHKz4sIVuxeL/brFddeEMV+RVGqDStFLIgFC+JVbCiKSJHeFtheknn/QH1BQZLMJCfJfD9/6ZI582w9T6ackQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAv4ztAPHmlJU9I6mz7RwAEBVj+pjc3F9tx4gD0+3IC3ZXhrqbsNlTAWcXOSqUlOHR+BWSWS2Ff5IJfGkyat6fOe2ZNR6NnVb8UAA+lXSQ7RwAEJVgsIPJzp5vO4ZXDjvm/J3DYQ2WTH9JrRO4a0fSx0YaW55jJnwxeWR5Aved1CgAAJCM0qQAHNpzcGvH0R3GOGfIu3f5sVrtSMM2FGx4aO7EidWWs1gXsB0AAJCWTLeeF1wtOT8Y4wyQ/clfkpoYaVhBcf5X3Xqe7/s3hhwBAIBklMJHAA7tfXGBqmqelcxxtrP8jRojc93M6SMfsB3EFo4AAAA80+3oc1uoqvaDJJ/8JSnTkXP/oT0uGCEfvBneFgoAAMATB/S4tKFxgtOVSndeGf3z0J4XPGI7hg0UAACAa126DM6sY6pfl9TJdpYYXNK95wWX2w6RaBQAAIBr2QW6Q1I32zli5Uj3dTv6wq62cyQSBQAA4Mqhx5zfxcgZYjuHS3WM4zzTpcvgTNtBEoUCAABwJ2wekRS0HcM9Z8+cwvBg2ykShQIAAIjZIUcPPkZpdau1ub5Xr8uzbKdIBAoAACBmATlX2s7gKUc7ldRUnWo7RiJQAAAAMTmwx/lN5eho2zm85wy0nSARKAAAgJhkSCcoOZb49dpRRxxxSV3bIeKNAgAAiIkx5nDbGeIkszYYOtR2iHijAAAAYmO0n+0IcRMI7207QrxRAAAA0SsqCsjRrrZjxI1jOtqOEG8UAABA1I54f1F9Sdm2c8SNE25kO0K8UQAAAFGrCmTn2c4QV8bUtx0h3igAAICoGdWk49X/W0r3z48CAACAH1EAAADwIQoAAAA+lPbnOGxbuXq9pk7/THO++1nrijcpHHZsR/pDQYO66tShtY47cn913LWVq7Eqq6r15nuf65PZc7Vs5VoZY9SqZRN1238PHXtEV2VmJs+P2vxflmrq9M/0/U+LtbGkXPn187Tnbjvr+B4HaNe2LVyNXVZeqanTZ+mzL+dp1Zpi1dSGPErtXl5uttq1ba4jD91XB3fZ3dVYoVBYH3z6td7/5GstXLJC1TUhNW9SoAP366Tjex6kBvVyPUodXytXr9eUd2Zpznc/a+36TcrNrqOO7Vrp6MO7qste7W3HA+LK2A4Qb05Z2aey8KQqx3E04ZUZevq5aaqpqU307qNijFGvow7QVRedpjp1on8U9pzvftYdIyZo1Zribf57syaFKrp6oPbo2NZlUncqq6o1YuTLeuPd2XKcvxaxgDHq07u7LjvnZGVkRP9k05mzvtU9jzynjSXlXsSNq7332FW3XDNIDQuiv9B58dJVKho2Rj8vWr7Nf6+bl6MhF52uow9L3jViHMfR+Jff1TPPv7nd388D9t1NNw0ZoPz6llaEDQY7mOzs+XZ2vmOHHHVem0AgsMh2jjj6+KPpT6b1aoCcAoiTx555XU+MnZz0k7+0+Y/hG+9+pmtvG6naKN+xzp4zT1cV/Xe7k7+0+V3WlTc9pu/mLXKZNHa1tSHdeNfTmjr9s21O/pIUdhy9POVDDR02eruv2Z7pH36h/9z9dEpM/pL09dwFuujaESreWBrVdr8uW61Lr39wu5O/JJWWVei2+8dp8tufuo0ZN4+OnqSR46b87e/n7DnzdNn1D6mkrCKByYDEoQDEwadffK/nX3/fdoyoffHNfI1/+d2IX7+xpFy33j8uopJTWVWtG+8apfUbStxEjNkTYydr9px5Eb125qxv9fKUmRGPvWpNse5+5HmFoywNtq1cvV73PPxcxK8Ph8MqGj42opLjOI6G/3eivvz2ZzcR42LKO7P0wmvvRfTaxctW64H/ToxzIsAOCkAcPPPcm7YjxOy5V99VZWVVRK99ecqH2ripLOKx128o0R0jJiR8opz1xQ96YdIHUW0z7uV3VFMb2dGbCa+8q6qqmliiWffx53P144JfI3rtR7O/008LlkY8digU1tB7n9HK1etjjee5735YqPv/+1JU20yfOUeLl62OUyLAHgqAx9as3aB5P0f2BzUZlVdU6X9f/xTRa2fO+ibq8WfPmacXEnh0pHhjqe56+NmoD+mvLy7R3AhPWXz4afRfh2QSaf5YPs+Nm8p0/R1PRVwq42ld8SbddO/oiIvd7xzH0UeffRunVIA9FACPLVm+JurJJtlE+m5n8dLY3hWNHDdFP8xfEtO20Qg7jm4dPlbri2M77bBwycodvqasokrrijfFNH6yiPT7vejXVTGNv2DRct0+IvoS5qXq6hrdcOcorV2/MabtFy5e4XEiwD4KgMdKy1LjIrC/U1Oz4wsBw+GwQuFwTOPX1oZ0y/CxKquI77vCZ1+ZEfHRjG2pDe3461CWBt/v0tLIPofKquqY9/HBp19HdX2J14Y99qJ++GlxzNtXVMb+uQPJigKAv2jRrHCHrwkEAmrauCDmfSxbsVbDH3sh5u13ZO6PizTq2TdcjdG8yY6/DojcU+On6pPP5yZ8vy+89p7efO/zhO8XSHYUAGwlEAio696RPQbb7WIy73z4pabNmO1qjG0pK6/ULcPHRX1L45bq1MnUvnt18DAVwo6jW4aPjflUQiy++Ga+Hh87OWH7A1IJBQBbOb7HASrMrxfRa/uddLjrFf7uf+Jlz6+wHv74i1qxap2rMU45rpvycrI8SoTflVdU6ca7Rqk0AffWr1y9XjcPG61QKLZTVUC6owDgD82aFOrCgSdE/PqWzRtp4OnHuNpnZWWVbhk2xrMFk6a8M0vvfPilqzGaNSnUuf84zpM8+Ksly1br5mFjFI7xGpJIVFRU6brbn4zqNlXAbygAkCS1a9tCD99xWdTLng7sd7T26+xuzfT5C5fp8THuD9MuXb5GD4161dUYwWBAQ4cMUF5utus82L7Zc+Zp1LPT4jK24zi6+5Hn9QtX7gN/iwLgY8YY7daulf514akaOXyImsVw0VvAGP3nXwPUoH6eqywvTfnQ1b3WNTW1GnrvaFW4vLPgvP691LnTLq7GQGTGvTRd7850d7RmW8a8+LZmfDTH83GBdJM8j2jzuQP23U1XXXRawvaXkRFUQX49ZWa4/xFo3LCBbrzyTF1325Mx3+vtOI7ufPBZPfPgtTHdXfDw069p/sJlMe37d/vs2U5n9u3haoxINSyor8fuvsLTMb/7cZFuu3+8p2PGk+M4uuvh59SqRRN12HUnT8b8aPZ3Kb0SJ5BIFIAkkZOdpRbNGtmOEbODu+yuvr276+UpH8Y8RklZhW57YLweuv1SBQKRH5z69H/f67VpH8e8X0nKr19XN191VlT7dSMYDHr+/V6xevsPZEpWVVU1uvHup/Xk8CGun7q3ZNlq3f7A+JR7JgNgC6cA4JlLzz5J7Xdx907u67kLNO6l6RG/fs3aDbpjxHhXq8wZY3Td5WeoUWGDmMdA7FauXq+iYWNcXa1fUlah625/UmXllR4mA9IbBQCeyczM0K3XDlKuy9vnnnn+TX37wy87fF3YcXT7iPGuH8F7+kmH69AD9nQ1Btz54pv5emz0pJi2DTuObhs+TkuXr/E4FZDeKADw1E7NG+ufF/R1NUYoFNbN9+34sbOjn3/L9eNmO+y6ky46K/JbHxE/L056X1PemRX1dv8dM1mffvF9HBIB6Y0CAM8d3+NAHXN4F1djrFm7QcMe3f5SwV/PXaAxL77tah/Z2Vm6+aqBrhczgnceGPmyvo9izf4PPvlaz7/2XhwTAemLAoC4uPrifmrVsomrMT749Gu99uZfL+4rKavQ7SMmuF5I5uqLT1drlxnhrerqGv37zlFas27HT+2bv3CZbh8xIeWfvgnYQgFAXOTkZGnokLNc32b48KjX9POi5Vt97K6HntXK1etdjduj+3469oiursZAfKwr3qSh9z7zt6tDbiwp1413Pe3qCYWA33HsE3GzW7tWumDA8TFf3CVtfkd4y31j9OTwq5SdVUcvT52pmbNiXzBI2ryE8TWX/p+rMRBf381bpGGPvaB///PMv/xbbW1IN939tOvnPcCd+watqq0qdb7ycsxsJ1ynrSlvHe12NU6geoHJXeJllmCGWXpY5DckpSQKAOLqjFOO1FdzF7h6DOyiX1fpkadfU9/e3fX4mNjLhLR5AaShQ87iQT8pYNqMz9WpfRv1Of7QrT7+4FOvaM537i7+hHsHty41crSPl2OGqx2V/xL9UzwD2SG12rnM6+d3p/09pZwCQFwZY3TdZWeosCCyJwxuz+tvfqJ/3fSYqqpqXI1z8cATtXuHNq7GQOI8NOrVrSb7aTNmu170CcBmFADEXWF+Pd181SAFjHE1zvoNJa62P6hLJ51+0uGuxkBibXm4f/NpgRdtRwLSBqcAkBD7dW6nM/ocqWdfmWFl/4X59XTDFf1lXJYQRM8Y4+pK/d8v+Fu3YZPrx0a7zQKkE44AIGEGDzhBe+7WNuH7DRijm4acpcJ8d6chEJvz+vdyXbzmL1ym9cXujgBlZATV7+QjXI0BpBMKABImGAzopn8NUF5udkL3O+C0nuq6d4eE7hP/3xGH7K1/9DnSdgxdecGp2md3HvUM/I5TAEnii29+0vlDhidsf5mZmx8HvEfHtupx6L5q1sTrC2i3rUWzRrrusjM09N7RCdlfpw5tdM4ZxyVkX9Eo3lDi+fe7vLLK0/G8dOHAE7VwyUp9+j87S/ae0qubTj7uEH30mbtbSIF0QgFIEqVlFfpxwa8J3+/MWd9q1IRp+kefI3Ve/14JeRzukd32Ue+eB2rq9M/iup+6eTm69ZpBysgIxnU/saiprbXy/bYlYIxuvnqQLrrmfi36dVVC99250y664vw+Cd0nkAo4BQDV1NZq7MR3dOsD7h6rG40rL+irNjs1jes+rr7o9IQd2cCO5eVk6Y4bzkvoKaCmjQt0xw3nul6REkhHFAD84d0Pv9TLU2YmZF/Z2Vm69bqzlZWVGZfxTz7uEPU4bL+4jI3YtW7ZRLdcc3ZCjjTVqZOp2647RwUN6sZ9X0AqogBgK6NffMv1rVaR2qV1c1086CTPx23bqqkuO/cUz8eFNw7cb7eEXJdxw+VnqFP7qFeVBXyDAoCtbNxUpi++mZ+w/Z3au7u6H9TZs/Hq1MnUzVcPUnZWHc/GhPcG9TtaRx26b9zGP7NvD/U8zN0jqYF0RwHAXyz8dWVC93fDFf09O1d/xXl91K5tC0/GQvwYY3T9ZWdolzbNPR97/306avBZvT0fF0g3FAD8RWWCbyerl5ejju1auR4nIyOoLnu39yAREiEnJ0v3/OcCNaif59mYrVo20a3XJuYaAyDV8VuCv2jauCCh+5s243N98MnXrseprQ2paNhY1dQm5hoGuNesSaFuueZsBYPu/xTl5mTpjuvPVd28HA+SAemPAoCtGGMSumre0hVrNGLkS56N9+OCX/XkuKmejYf467JXe13i8mLQgDEaetVZ2rl1M49SAemPAoCtHH7I3mrSKDFHAGpqanXzsDEqr/D2lMPzr7+vTz6f6+mYiK9+Jx+hE44+KObtzzvzeHXbf08PEwHpjwKAPxTm19Pl556csP09NmaSflqw1PNxHcfRXQ89p3XFmzwfG/Hzr8GnqlOHNlFvd9hBe+ms03rGIRGQ3igAkLT5vP99RRcl7N3/rC9+iOuiQxs2leqW+8YqHA7HbR/wVp06mbrr3+epccMGEW+za9sWuulfZ/KYZyAGFACfa9ywgc467WiNfvBatd+5ZUL2uWbdRt0+Iv7LDs/57mc999p7cd0HvNWwoL7uuWlwRI9ubtuqqYbdNFjZ2VkJSAakHxbIThL7dW6nS85J3OF3SSpoUFeNG+Yn9N1T2HF0x4jx2ripLCH7e3L8VO29+67ac7e2CdlfpArz6+neoYM9HfOH+Us0/PGJno5pQ/udW2rkfUP08KjX9OGsb/5SFIPBgE469hANHtCbK/4BFygASaJe3Tx13NX9vfDJbuyLbyd0pcFQKKyi+8bomQevVb0kmiwyMjI8/36XllV6Op5NTRsX6Pbrz9HK1es164sftGL1OmUEg2rZvJEO2X8P5ddnfX/ALQoAEuab73/R6BfeSvh+V60p1r2PvqDbrj074fuGO82aFOqUXt1sxwDSEtcAICFKyyp02wPjFQrZuSjv/Y+/0pR3ZlnZNwAkIwoAEuKuh57TytXrrWZ48MlXtHjpKqsZACBZUAAQd6++8ZE+nPWNqzFat2yif/Q5ytUYlVXVunnYGFVX17gaBwDSAQUAcfXLkhV6dPTrrsbIzMxQ0dUDddGgE7Vf53auxlqwaLkefWaSqzEAIB1QABA3lZVVGnrPaFVVuXvHfcmgk9R+l50UMEb/uXKAGtTLdTXeK2/M1MxZ37oaAwBSHQUAcTPCg3PuB3XppFNP6P7H/zdulK8brxzgeu2Cux561vo1CQBgEwUAcfHex19p6vTPXI3RuGED/Wcbk/3BXXd3fWtYSVmFbh8xgaWCAfgWBQCeW75yre555HlXYwSM0Y1XDlCD+nnb/PfLzz3F9dLFX89doNEvvO1qDABIVRQAeCoUCuu2B8arrNzdqnQD+x2tLnu13+6/Z2Zm6NZrz1ZOjrt14Me88Ja+/DZxKxMCQLKgAMBTT4ybou/mLXI1xu4d2mhQv2N3+LqdWjTWFef1cbWvsOPo9gcS92wCAEgWFAB4ZvZXP+oFl0/fq5uXo1uuGaSMjGBErz/h6IN09GH7udrnmnUbdceICXF/OiEAJBMKADxRvLFUd46YoLDLSfTqi09XsyaFUW1z1cX91LxpQ1f7/fSL7/XKGx+5GgMAUgkPA0oS3/+0SEPvHZ3QfRbm11OnDm106AF7Ki83O+Zxwo6j2+8fp3XFm1zlOaVXN/XoHv27+bzcbN1yzSBdev1DqqmtjXn/jz7zuvbqtLPa77JTzGMAQKqgACSJNes26r2Pv0r8jqfOVL28HF0woLf6HH9oTEM89+oMzf7qR1cxdm7dTJeec3LM23dq31rn9u+lJ8ZOjnmMmppaDR02RqPuv1q5Li8uBIBkxykAqKSsQvc/8ZIeeurVqLf9Yf4SjZowzdX+69TJ1M1XDVR2Vh1X4/Tve5T236ejqzGWLl+jh556xdUYAJAKKAD4w8TJH+it9/8X8etramp16/3jXB12l6R/nt9Hu7Zt4WoMSX8sFVzQoK6rcaZO/0wff/6d6zwAkMwoANjKE+OmKBSKbHW81978WEuXr3G1vyO67aOTjj3E1RhbKiyo58lSwY/zwCAAaY4CgK2sWbtBX3//S0Svnf7hl6721axJoa679P9cjbEtB+63m/7vpMNdjbF42Wr9tGCpR4kAIPlQAPAX8xf8usPXhB1HPy9aHvM+gsGAhg4ZoLp5OTGP8XcuHHii9ujY1tUYPy9a5k0YAEhCFACPZWak/o0VZRVVO3xNKBRSdXXsj/k99x+91LnTLjFvvyMZGUH9519nurqav7x8x1+HjBi/35mZkS10FI2MYGy/zpmZkX0OmREuzvRnGUHvP9dYxf79Sv3fa+DPKAAea1TYwHYE1xoV1t/hazIzMlS/bm5M4+/Xub0GnNYzpm2jsVPzxrrq4n4xb19YUG+Hr8mvnxdT6YvHz0msY0a6XaOG0Y8fMCapfidi+RwkqWEEvxNAqqEAeKzdzi22+wS7VLFf5+0/hGdL+0b4ui3l16+rm4YMUMDlRXqROubwLup11P5RbxcIBLTPHu0iet3ee0R/JKPr3h2i3mZHWjZvFPUqipLUda/IskT6c7GlPXbbWVlZmVFvFy+7tGmuwvwdF7s/6xLD5w4kOwqAxwKBgE46xrur2hNt/306aqcWjSN6bd/e0S0cZIzRv//ZP+HvCP81+DS1atkkqm0OP3iviI4ASJtXMIxGnTqZ6nXUAVFtE6k+vaL7njQqbKBuB+4Z0WuPPWL/qJ++GO3XJt4CxuikYw+OapuWzRvpgH13i1MiwB4KQByceVpPtYlywkkGeTlZ+ufgUyN+/X6d2+u4IyN/d92/z1E6uOvusURzJScnS7dcMyjiyatBvVxddm7kqxIedtBeOvSAyCZRSTq/fy81bVwQ8eujcWrv7uqwa2RLGRtjNOTC0yJegKmwoJ4uPOuEiLMcsE9H9XT5oKZ46N+nh9q2ahrRawOBgK666PSIH04FpBIKQBzk5WTp3qGDU6oE1K+bqztvvCDqzNdc0k+HH7z3Dl93Sq9uunBg5JOH19rv3FJ3XH/uDp95kF+/roYNvVBNGkU+QRtjdNOQs3RABKsQ/qPPUTrjlCMjHjtaWVmZuvvGC9R+55Z/+7pgMKAhF52m7gd1jmr8U3t31zlnHLfDdRb23bOdbrn27ISd6olGTk6W7r1psNrs9PclIDMzQ//+Z3/Xq0sCySr5fjs95pSVfSrpIBv7Lq+o0oSXp+v1Nz/WxpJyGxF2KDurjo7sto/OP7NXVJPelhzH0Zvv/U8TXnpHi5et3urfOuy6k87ud2zUE028rFi1TqOenaYZH3211QqGOTlZ6tl9P53f//iID/3/WTgc1qS3PtWzr87QilXr/vi4MUa7d2ijc/9xXMIOJVdWVeuF19/XK1Nnav2Gkj8+HggEtP8+HXTBgN7quGurmMf/8tv5emrCNH03b+FWj1Fu2rhAZ5x8pE7p1S3p3zWXV1Tp2Vfe1WtvfqyNm8r++HhGRlAH7ddJFwzorV3aNLcXMBjsYLKz59sL8Pec947YSY52fM9wFMLVjsp/CUW9XSBLyt3Z8zs1Zpmj3o/ufFGKoQAkQDgc1oJFy7V63QZVV7tbNtcrGcGgCgvqqV3blp5epLV0xRotX7VeAWPUumXjmEtFvFVWVevHn39VaXmFChrU0y5tmrt+FsGWlixbrRWr1qtOnQzt1LyxGsd49blbYcfRwsUrtHrtBuXmZKlt6+ZqUC+2uze2ZV3xJv26bLUqqqrVomnDHb6rTka//36uXb9JebnZ2qVN87itTxEVCkDEKACxoQAAQDKiAESMAhAbrgEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD1EAAADwIQoAAAA+RAEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD1EAAADwIQoAAAA+RAEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD1EAAADwIQoAAAA+RAEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD1EAAADwIQoAAAA+RAEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD1EAAADwoQzbAZA6nNqQyqfMUcVb36hm8RqpqlbBnQqV3a2j6vY7SIH8XNsRAQARogAgIjU/rdTaf45R7aI1W328dnmxqmYvUMmTM1RQdKpye+9rKSEAIBoUAOxQ1ZxFWnvBkwqXVW33NeHSSq275lk5VbXK67t/AtMBAGLBNQD4W1VzFmnN+X8/+f/BcVR8y8uqXbw2/sEAAK5QALBdv0/+TnkEk/9vnOpabXpyRhxTAQC8QAHANsUy+f+uYsZcyXHikAoA4BUKAP7i93P+sUz+khQuLlN4Y4XHqQAAXuIiQGyl6suFWnPBUzFP/r9zakMeJQIAxANHAPAHryZ/k5elYGFdj1IBAOKBAgBJ3k3+kpRzaEcpYDxIBQCIFwoANl/w59HkL2NU77wj3Y8DAIgrrgFIFo6jivd/UMVbX6tm4Ro5ldXKaFGo7G4dlNd3f5ncrLjs1st3/pJUf/BRqtO5lSdjAQDihwKQBGqXF2vdkHGq/nrJVh+v+WmlKt7/Xhsfe0eFt/VTTo89PN2v15N/Xt8D1OCK4zwZCwAQXxQAy0IrirX6jIcVWrNpu68JF5dp7RWjVXDjKarbv5sn+/V88j/1ABXeenpM5/7LKqr05ruf6bM587Ry9XpVVdd6kgnYUp3MoBo3zFeXvTvo+B4HqqABF6rC3ygANjmO1g6Z8LeT/x/Cjopvf02SXJeAZJr8P5z1je599AVt3FTmSRbg7yz6dZU+/+pHjX3xbV127ik68ZiDbUcCrKEAWFQ5c56qv1oU+QaO+xKQTJP/2x98oTseGK8wqwYiwcorqnTvoy+opLRC/fseZTsOYAV3AVhU/ta30W/0WwkoffbjqDdNpsl/xap1uueR55n8YdUTYyfr+58W244BWEEBsKhmwarYNvy9BIz/KOJNPL3VT5sv+It18pekcS9NV3V1jSdZgFiFHUdPPzfNdgzACgqATaFw7Ns6jorvfD2iIwFVXy6M+cE+25J36gEqvC32yd9xHM2cFcPRDyAOvvhmvsoqvPndAFIJBcCiYLN8dwNEcDogmQ77/25jSZk2bCr1JA/gVm1tSMtXrLEdA0g4CoBF2d07uh/kb0pAMk7+0uY/uEAyqa7h1lP4DwXAoryTuijYtIH7gbZxTUCynfPfUkGDeqpTJ9ODVIA3mjUptB0BSDgKgEUmO1OFd/6flOHBt+H3awLGf7R58vfynH9fd+f8/ywYDKjr3h08GQtwq13bFmpYUN92DCDhKACWZR/SQYW3nObN5PpbCVhz7hNJc8Hf9vTvw73XSA79T+1pOwJgBQUgCWx+h93PsxLgVHpze52Xh/3/bO89dtWpvbt7Pi4QjcMO2ks9FXwk5wAAFYNJREFUu+9rOwZgBSsBJom8vvtLktbf9KIUtr84jteH/bfl8vP6SJJenjozbvsAtqdH9/10/eVnyJj4/YwDyYwCkESSpQQkYvKXNl8LcOXgU3Vkt330/Gvv6fOvf1RVFYsDIX4yMoLad892OvWE7uq2/5624wBWUQCSjO0SkKjJf0t777Gr9t5jV4UdR8UbSlRVVZ2wfcM/MjMzVZhfT8EgZz4BiQKQlGyVABuT/5YCxnA1NgAkCFU4SeX13d+7CwMj2p/dyR8AkFgUgCSWqBLA5A8A/kMBSHLxLgFM/gDgTxSAFBCvEsDkDwD+RQFIEV6XACZ/APA3CkAK8aoEMPkDACgAKcZtCWDyBwBIFICUFGsJYPIHAPyOApCioi0BTP4AgC2xEmAKy+u7vwL1srXuhufllG3n8b8Bo/oX9lSDy4+ReOgJAOA3FIAUl3N0ZzXfu41Knn5fFe98q9rlxZKkQINcZR/aUfXPP1KZu7WwnBIAkGwoAGkg2KS+8q8/SfnXnySnskYKh2Vys2zHAgAkMQpAmjHZmbYjAABSABcBAgDgQxQAAAB8iAIAAIAPUQAAAPAhCgAAAD5EAQAAwIcoAAAA+BAFAAAAH6IAAADgQxQAAAB8iAIAAIAPUQAAAPAhCgAAAD5EAQAAwIcoAAAA+BAFAAAAH6IAAADgQxQAAAB8iAIAAIAPUQAAAPAhCgAAAD5EAQAAwIcoAAAA+BAFAAAAH8qwHcDv1tdKDy8L67V1Yf1YIVWEHNuRFDRS8zpGPfONrmgZ0L51je1IAACPUQAseqvYUf8farW+1naSrYUcaWmVo9GrHI1ZFdaQlgHds0tQQXoAAKQNTgFY8uGGsE6am3yT/585koYvC+uCn0K2owAAPEQBsKAs5OiMeSFVh20nidwzq8Kaut7+6QkAgDcoABaMXuVoRbXtFNG7cwlHAQAgXVAALJi6PoXe+m9hVomjdUl+ygIAEBkKgAULKm0niE3YkRZWcBoAANIBBcCCshQ+kl6SmgcvAAB/QgEAAMCHKAAAAPgQBQAAAB+iAAAA4EMUAAAAfIgCAACAD/EwoBSy9MAMtczy5ok8R31dq/c2ck8/APgVRwAAAPAhjgAgKVRUVOmr7xdoxap1qqhMwQclIOll18lUk0YF2qdzO9XLy7EdB7COAgCrysorNerZaXr9rU9UXV1jOw58IBgM6JjDu+qigSeqsKCe7TiANZwCgDVr1m7Qhdc8oImTP2DyR8KEQmFNmzFb5189XAuXrLQdB7CGAgAramtDuv7Op7R46SrbUeBTa9Zu0HW3P6nSsgrbUQArKACwYtLbn+inBUttx4DPrVi1ThNenm47BmAFBQBWTHnnM9sRAEnS1OmfKexwSyz8hwKAhKuqqtHPC5fZjgFIkoo3lmrZ8jW2YwAJRwFAwm0sKZXDOy4kkeKNpbYjAAlHAUDC1cvLtR0B2EqD+nm2IwAJRwFAwuXkZKltq6a2YwCSpPp1c7VT88a2YwAJRwGAFb2OOtB2BECSdPQRXRUM8qcQ/sNPPazo2/tQtWrZxHYM+Fxhfj0N6neM7RiAFRQAWJGdVUd333i+GjdsYDsKfKpeXo7uuOE8FTSoazsKYAUFANa0btlETw6/Sj0O20/GePOYYyASB3XppJHDh2jP3drajgJYw8OAYFXDgvoqumqgLhl0ombP+VGr1qxXTU3IdiykoWAwoMYN89V1nw5c9AeIAoAk0aRRgU44+iDbMQDANzgFAACAD3EEIIUc8lVIGR5VthXV3owDAEhNFIAUsqSK5XMBAN7gFAAAAD5EAQAAwIcoAAAA+BAFAAAAH6IAAADgQxQAC3JT+Kuey4q9AJAWUngqSl1tsmwniI2R1DaHBgAA6YACYMFxDVPzy75vXaOmmbZTAAC8kJozUYo7r2lADVNwCaZrd+LHBQDSBX/RLcjPkJ7sEFQghY6m920UUL8m/LgAQLrgL7olfRoFNLZjhrJT4DtwZhOj8R0DSqG+AgDYgRSYftLXmU2M5nXN0EXNA0l3bj0rIB1XYPTGnhkav1uGcoJM/wCQTlLwTHR6aZNt9Hj7oB5vH9TGkLSu2v4Df3KCmy/2S6VTFACA6FAAkkiDoNSA2+wAAAnAKQAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EAUAAAAfogAAAOBDFAAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EI8DBgBErSIccGqrg+u9HNOpDgcDwXD9aLcLy4RKqjI3eZnFyJR6OV4yogAAAKKW22PG8hMHFq2QtIftLNo8lxV6POan0tseD5lcOAUAAIiF4xgz3HaIOKkMBfSY7RDxRgEAAMSkRVaz8ZKW2M4RB0+/Mbpope0Q8UYBAADEZOTIC2uMYx6yncNjIRPWA7ZDJAIFAAAQs0rl/lfSOts5vOIYTZw0vuhn2zkSgYsAk8CKamnq+rDmlTkqCdtOI9UxUssso575Rl3rGdtxACSxt8ddU3biwKInJP3bdhYvmJCG2c6QKBQAi8pCjq5dGNaTK8KqcWyn+asbJHVrYPR4u6A651EEAGxbhqMHa43+JSnHdhaX3p48vuhL2yEShVMAlmwMSYd9HdJjy5Nz8v/dxxsdHfJVSO9tTOKQAKx6dVzRamM0xnYOtxxj7rWdIZEoAJYMmhfSl6WpMamWhhydNrdWy6pSIy+AxAsFNUxSyHaOWBnpqyljbp5hO0ciUQAs+GBDWK+vS4KT/VFYXyvdtiS1MgNInKlPF/0io1ds54iZY+6U5Kt3ORQAC8atTs2fsedXJ/fpCgB2hYxScxJ19EtWZafULS8xogBYkCqH/v9sY0j6ucJ2CgDJ6o3RRV9JSr3D6MbcO3Fiv5Q9fRErCoAFa2tsJ4jd6mpOAwDYPhM299jOEKXV2RX1xtoOYQMFwIJUnkLDhtsBAWzfpPE3vyOjVLqV7sGJE4f48tgmBQAA4CkTTpnFdErCtVmP2w5hCwUAAOCprMrdJ0pK/uV0jUZOffaGYtsxbKEAAAA89dsFdcn+QJ0aOUq3BxlFhQIAAPBcSUBPS0rmR+qOnzy2KB0fZRwxCgAAwHPvjy6qNDKP2c6xHY5MYLjtELbxMKAUcs8uQeUHvRnr/qUh/ejL614BJEpVpvNonRpdK6mu7SxbcqTJU8YMnWs7h20UgBRyZmOjllne3Ib3/OqwfqxIzQWJAKSGt0YVrT9xUNFTcnSl7SxbCpiArx76sz2cAgAAxE1trYZLqradYwsfTRoz9GPbIZIBRwBg3eKlqzRx8gf67Mt5WrNug0KhVF4qCckqYIwaFtZXl706qG/v7urUvrXtSL4wbULR0pPOKnreMRpoO8tvUm2lwrihAMAax3E0/uXpGvXsNCZ9xF3YcbRm3Ua9+d7neuv9/+m0Ew7TpeecrGCQA6HxFlLw7oBCA2T/qPMPXXbRG5Mth0gWtr8Z8LHRL7ylkeOmMvkj4RzH0cTJH+ieR563HcUXpo676QdJb9jOYWTuKSoq4g/ObygAsOLHBb/qmeffsh0DPjdtxmx9NPs72zF8IRy2e+GdkZZmVTjP2cyQbCgAsGLCy+/KcbgLAfaNf2m67Qi+MHX80JmO9Imt/TvG3D9xYlEyXYxoHQUACRd2HM368gfbMQBJ0vc/LdaGTaW2Y/iCkbF1FKDYBLOfsrTvpEUBQMIVbyhRRUWV7RiApM3XA6xYuc52DF+YPPbmSZISvgCPcfTopKevK0n0fpMdBQAJFwjwY4fkEuBOgERxHGMSvQRvZW1QjyZ4nymBn3okXIP6ecrLzbYdA5C0uZA2b9rQdgzfaJHVbLykXxO4y6ffGF2UzA8lsoYCgIQLGKNu++9hOwYgSercaWfVr5trO4ZvjBx5YY1Mwh7DGzLhpH8ssTUUAFgx4LSjWYAFSeGcM46zHcF3TDDnCUkbErCrlyaNL/o5AftJSfwFhhU7t26mS84+yXYM+NwZJx+hLnu1tx3DdyY9fV2J4+jxeO8nbALD4r2PVEYBgDX9TjpCV118urKyMm1Hgc9kZAR1Xv9euuSck21H8a1MaYSk+D2U3OidqWOGfhG38dMAzwKAVacc103duu6hV6d9pFlfztOq1eu1qbTcdiykobycLDVtXKiu+3TUKccdolYtm9iO5GuvjitafeLAorGSLozH+AFHPPJ3BygAsK5xo3wNPusEDT7rBNtRACRQOEP3Bmp1vqSgx0N//frYonc9HjPtcAoAAGDF1KeLfjHSq54PbHSnJNYa3wGOAKSQx5aHVT/DeDLWElbEBpAMHN0jo9M8HO+XkiV6xbPx0hgFIIXc+StPsQSQXiaNK/rfiQOLZkg6yovxHGnY++8X1XoxVrrjFAAAwC6jezwaaXVOZf0xHo2V9igAAACrJo8peltGX7oeyDEPTZw4JH63FqYZCgAAIAmY+1wOUJZhMv/rSRSfoAAAAKzLLu/0oqQFsW5vpCdeHftvnuscBQoAAMC6iRP7hRzHxPrgnhpHetDTQD5AAbDA6xUvEinocGstgPgwOc4zktZEv6EmTB5btMT7ROmNAmBB4xRe+r5JFj8yAOJj8siiciPzcJSbOVLA7fUDvsRfcwsOrO/NYj6J1jBDap9tOwWAdFaV6TwqqTTS1zvS5Mljhs6NY6S0RQGwYGCTgFKxAgxoGlQwFYMDSBlvjSpa70ijIn19wAR46E+MKAAWHFjf6MwmqTWTNqsj3diaHxcA8RcK6T5JkSxY/tmkMUM/jneedMVfdEueaB/U4fmp8eUvzJBe3T0jpa9dAJA6pk0oWirphR29znHMHQmIk7ZSYwZKQ7lBo7f3DOqm1gHlJfFx9d6FRrP3zdBBKXrdAoDUFHaCd0n6uwegzOu6qzM1UXnSUdr/VXfKyj6VdJDtHH+nJCS9UxzWD+VSScj+bXaZRtopy6hHvlG7nLT/EQGSUzDYwWRnz7cdw6YTBxZNkdR7m//o6JzJ44pGJzRQmuFpgEmgXlDq24iDMQCwJWN0r+NsswAsy67UswkPlGaYdQAASWnSmKIPHemTP3/cke6fOLEokosE8TcoAACApGXCGvanDxUHMnKetBImzVAAAABJa/L4otdl9P0fHzB6bNLT15VYjJQ2KAAAgGTmGEfDf/vvypDRI1bTpBEKAAAgqTXLbj5O0q+SnnljdNFK23nSBQUAAJDURo68sMaRRjiBYKyPC8Y2UAAAAEmv6y4aMWX0Tb5eF8Frab/KSyosBAQAf8FCQIgzjgAAAOBDFAAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EAUAAAAfogAAAOBDFAAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EAUAAAAfogAAAOBDFAAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EAUAAAAfogAAAOBDFAAAAHyIAgAAgA9RAAAA8CEKAAAAPkQBAADAhygAAAD4EAUAAAAfogAAAOBDFAAAAHwow3YAeMtxHJVs2GA7BgCXwuHwu8WLF9fYzpEojvRzYZs2x9rO4ScUgHTjOAqHQrZTAHCvle0AiWSkStsZ/IZTAAAA+BAFAAAAH6IAAADgQxQAAAB8iAIAAIAPUQAAAPAhCgAAAD5EAQAAwIcoAAAA+BAFAAAAH6IAAADgQxQAAAB8yA8FwLEdIJF89ckCSCdh2wH8xg8FoMx2gIRyqAAAUo/jOP76W50E/FAASm0HSCSHAgAgBRljSmxn8Bs/FIANtgMkEgUAQIry1d/qZOCHArDAdoBECodCtiMAQNSMNN92Br9J/wJgzE+2IyRSiAIAIAU5xlAAEiz9C0AoNNd2hETiCACAVBQw5nvbGfwm/QtA3brfS1prO0ai1NbU2I4AANEqrb9q1Ze2Q/hN2hcAY4wj6UPbORIhVFvLRYAAUo5xnI9M1668e0mwtC8Av3nLdoBEqOHdP4AU5AQCb9vO4Ef+KAA1NRMlVdmOEW81lZW2IwBAtMIhY160HcKPfFEATH5+saRptnPEU6i2ljsAAKSiGY1atVpmO4Qf+aIASJIc5wnbEeKpuirtD3AASENGSuu/zcnM2A6QSE5Z2f8kdbGdw2tOOKxNxcVcAAggpTjSjwWtW+9ujOFBQBb45wiAJBlzj+0I8VBZUcHkDyDlGGPuZvK3x19HABzHqKzsfRlzmO0sXgmHQirZsIECACDVzMlv3Xp/YwwXL1niqyMAv60JcJmkWttZvFJRVsbkDyDVOGHHuZTJ3y5fFQBJMnXrfitjRtjO4YWaqirVVFfbjgEAUTGO89+Gbdt+ajuH3/nqFMDvHMfJVHn5B5IOtp0lVhz6B5CivisNBA5o1apVhe0gfue7IwCSZIypUSBwpqT1trPExHFUVlLC5A8g1ZSEwuHTmfyTgy8LgCSZnJyFMuZ4SWW2s0SrrLRUodq0uYwBgD/UGGNOa7TzzvNsB8Fmvi0AkmRycz+T1F8pdFFgRVmZalj0B0BqCTvGDMpv3Zo1/5OIrwuAJJm8vEmS+kpK+kNSFaWlqqpI+pgAsKVqx3HOKmzd+jnbQbA1X14EuC1ORcWhCocnSSqwneXPHMdReWkp7/wBpJoSI/XNb9Nmuu0g+CvfHwH4ncnJ+UiBwL6SkurWlHAopNKNG5n8AaSa7x1jDmHyT14UgC2YnJzFys09Qo5zvyTry1NWV1WpZMMGLvgDkEoc4ziPbQiHuxS2bv2d7TDYPk4BbIdTVravpEckHZLofYdDIZWXlqq2pibRuwYAN74KO86lDdu2/cR2EOwYBeBvOI4TUFnZGTLmekmd472/cCikqooKVVVVSdzjDyBFGGmeY8w9+a1ajWN539RBAYiA4zhG5eUnSLpI0jGSMrwcv7amRtWVlaqurmbiB5AqQo70bsBxRjZo0+ZVnuqXeigAUXJKShorEOgn6ThJ3SU1iHoMx1Gotla11dWqrq5WOERhBpASSow005HernWcFxu3bbvCdiDEjgLgguM4QZWX7y3H2VPGdJAxO8txGkuqK6mOJOM4TsAJhzNCoVCdUCiUHQ6FskO1tbmO43ABJgBbHDlOuSNVyHGqHKlKjlOrzRc/O8aYGsdxSo3jrJExixxjfgpIc+u3ajXHGMNVyQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAlPf/AM9laU/NNA9hAAAAAElFTkSuQmCC')
                                                  : await provider.editSettings(
                                                      phoneController.text,
                                                      nameController.text,
                                                      "test",
                                                      cityController.text,
                                                      townController.text,
                                                      streetController.text,
                                                      emailController.text,
                                                      picture:
                                                          'iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAACAASURBVHic7d13gBPV4vbx5yS7bKPsLh2kqBRRsYEVsYEFsYHKz4sIVuxeL',
                                                      oldP: oldController.text,
                                                      newP: newController.text);
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
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    focusNode7.dispose();
    focusNode8.dispose();
    // focusNode9.dispose();
    // focusNode10.dispose();

    super.dispose();
  }
}
