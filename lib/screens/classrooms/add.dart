import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/providers/providers.dart';

import '../../models/models.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';

class AddClassroom extends StatefulWidget {
  final Function(Classroom) onAdd;
  final Function(Classroom) onEdit;
  final Classroom? classroom;
  final bool isEditing;

  const AddClassroom({
    Key? key,
    required this.onEdit,
    required this.onAdd,
    this.classroom,
  })  : isEditing = (classroom != null),
        super(key: key);

  @override
  State<AddClassroom> createState() => _AddClassroomState();
}

class _AddClassroomState extends State<AddClassroom> {
  final _maxNumberController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();

  int? classDDV;

  @override
  initState() {
    Provider.of<AppProvider>(context, listen: false).getSeed();
    final classroom = widget.classroom;
    if (classroom != null) {
      _maxNumberController.text = classroom.name.toString();
    }
    focusNode1.addListener(() {
      setState(() {});
    });
    super.initState();
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
                    'Add Classroom',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                //name class
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
                            labelText: "Maximum number",
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
                          controller: _maxNumberController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: DropdownButton<int>(
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                //submit
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: widgetSize.getWidth(150, context)),
                  child: SizedBox(
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
                          var response = await provider.addClassroom(
                            maxNumber: _maxNumberController.text,
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
                              EasyLoading.showSuccess(
                                  response.data!.message!,
                                  dismissOnTap: true);
                            }
                          }
                        }
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(height: 2,
                    thickness: 2,
                    color: Colors.black38,),
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
    super.dispose();
  }
}
