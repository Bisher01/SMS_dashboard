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
  DateTime? _selectedEndDate;

  void _presentDatePicker(DateTime date) {
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
        date = pickedDate;
      });
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
          //crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //subject name
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Subject:",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${widget.exam.subject_mark!.subject!.name}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //start
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
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
                                  '${widget.exam.start!.year}-${widget.exam.start!.month}-${widget.exam.start!.day}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //end
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
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
                                  '${widget.exam.end!.year}-${widget.exam.end!.month}-${widget.exam.end!.day}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    _presentDatePicker(_selectedStartDate!);
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (widget.exam.active == 0) {
                      final provider =
                          Provider.of<AppProvider>(context, listen: false);
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
                          if (response.data != null && response.data!.status!) {
                            EasyLoading.showSuccess(response.data!.message!,
                                dismissOnTap: true);
                            Provider.of<AppProvider>(context,listen: false).getAllExams();
                          }
                        }
                      } else {}
                    }else{}

                  },
                  icon: const Icon(
                    Icons.check_sharp,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final provider =
                        Provider.of<AppProvider>(context, listen: false);
                    if (await provider.checkInternet()) {
                      var response = await provider.deleteExam(widget.exam.id!);
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
                        if (response.data != null && response.data!.status!) {
                          EasyLoading.showSuccess(response.data!.message!,
                              dismissOnTap: true);
                          Provider.of<AppProvider>(context,listen: false).getAllExams();
                        }
                      }
                    } else {}
                  },
                  icon: const Icon(
                    Icons.delete_outline_sharp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
