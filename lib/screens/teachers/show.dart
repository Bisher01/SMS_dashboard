import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/models.dart';
import '../../utill/widget_size.dart';

class ShowTeacher extends StatefulWidget {
  const ShowTeacher({Key? key}) : super(key: key);

  @override
  State<ShowTeacher> createState() => _ShowTeacherState();
}

class _ShowTeacherState extends State<ShowTeacher> {
  @override
  initState() {
    // Provider.of<AppProvider>(context, listen: false).getAllTeachers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.fTeacherResponse != null) {
        switch (provider.fTeacherResponse?.status) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: provider.fTeacherResponse!.data!.teacher!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: widgetSize.getWidth(200, context) /
                    widgetSize.getHeight(300, context),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.white70,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                content: SizedBox(
                                  width: widgetSize.getWidth(200, context),
                                  height: widgetSize.getHeight(500, context),
                                  child: TeacherShowCard(
                                    teacher: provider
                                        .fTeacherResponse!.data!.teacher!,
                                    selectedTeacher: index,
                                  ),
                                ),
                              );
                            });
                      },
                      child: TeacherSmallCard(
                        teacher:
                            provider.fTeacherResponse!.data!.teacher![index],
                      )),
                );
              },
            );
          case Status.ERROR:
            return Error(
              errorMsg: provider.fTeacherResponse!.message!,
            );
          default:
            return Container();
        }
      }
      return Container();
    });
  }
}
