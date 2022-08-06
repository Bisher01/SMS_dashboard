import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import '../models/models.dart';
import '../services/api_response.dart';
import '../utill/widget_size.dart';

class ExamCard extends StatefulWidget {
  final AllExams exam;
  const ExamCard({required this.exam, Key? key}) : super(key: key);

  @override
  State<ExamCard> createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> {
  DateTime? _selectedStartDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  initState() {
    _selectedStartDate = widget.exam.start!;
    _selectedStartTime = TimeOfDay(hour: widget.exam.start!.hour, minute: widget.exam.start!.minute);
    _selectedEndTime=TimeOfDay(hour: widget.exam.end!.hour, minute: widget.exam.end!.minute);
    super.initState();
  }

  void _presentDatePicker(DateTime date) {
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
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedStartDate = pickedDate;
      });
    });
  }

  void _presentStartTimePicker(TimeOfDay start) {
    showTimePicker(
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
        initialTime: start).then((pickedTime) {
          if(pickedTime==null) {
            return;
          }
          else{
            setState((){
              _selectedStartTime = pickedTime;
            });
          }

    });
  }

  void _presentEndTimePicker(TimeOfDay end) {
    showTimePicker(
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
        initialTime: end).then((pickedTime) {
      if(pickedTime==null) {
        return;
      }
      else{
        setState((){
          _selectedEndTime = pickedTime;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: widget.exam.active == 0
              ? Colors.red
              : const Color(
                  0Xff2BC3BB,
                ),
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                "Exam info",
                style: TextStyle(
                  color: Color(
                    0Xff2BC3BB,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Subject: ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${widget.exam.subject_mark!.subject!.name}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          final provider =
                              Provider.of<AppProvider>(context, listen: false);
                          if (await provider.checkInternet()) {
                            var response =
                                await provider.deleteExam(widget.exam.id!);
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
                                EasyLoading.showSuccess(response.data!.message!,
                                    dismissOnTap: true);
                                Provider.of<AppProvider>(context, listen: false)
                                    .getAllExams();
                              }
                            }
                          } else {}
                        },
                        child: const Icon(
                          Icons.delete_outline_sharp,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          if (widget.exam.active == 0) {
                            final provider = Provider.of<AppProvider>(context,
                                listen: false);
                            if (await provider.checkInternet()) {
                              var response =
                                  await provider.acceptExam(widget.exam.id!);
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
                                  Provider.of<AppProvider>(context,
                                          listen: false)
                                      .getAllExams();
                                }
                              }
                            } else {}
                          } else {}
                        },
                        child: const Icon(
                          Icons.check_sharp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //exam type
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Exam type: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.exam.exam_name_id!.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //date
                      InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          _presentDatePicker(widget.exam.start!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Date: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${_selectedStartDate!.year}-${_selectedStartDate!.month}-${_selectedStartDate!.day}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //mark
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Mark: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.exam.mark!.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //start
                      InkWell(
                        hoverColor: Colors.transparent,
                        onTap: (){
                          _presentStartTimePicker(TimeOfDay.fromDateTime(widget.exam.start!));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Start: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${_selectedStartTime!.hour}:${_selectedStartTime!.minute}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //season
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Season: ",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: widget.exam.season_id!.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //end
                      InkWell(
                        hoverColor: Colors.transparent,
                        onTap: (){
                          _presentEndTimePicker(TimeOfDay.fromDateTime(widget.exam.end!));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "End: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${_selectedEndTime!.hour}:${_selectedEndTime!.minute}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
