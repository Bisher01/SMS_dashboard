import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_dashboard/providers/providers.dart';
import 'package:sms_dashboard/services/api_response.dart';

import '../../components/components.dart';
import '../../models/models.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({Key? key}) : super(key: key);

  @override
  State<ShowStudent> createState() => _ShowStudentState();
}

class _ShowStudentState extends State<ShowStudent> {
  @override
  initState() {
    Provider.of<AppProvider>(context, listen: false).getAllStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.fStudentResponse != null) {
        switch (provider.fStudentResponse?.status) {
          case Status.LOADING:
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return StudentShowCard(
                    student: Student(),
                  );
                },
              ),
            );
          case Status.ERROR:
            return Error(
              errorMsg: provider.fStudentResponse!.message!,
            );
          case Status.COMPLETED:
            return GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: provider.fStudentResponse!.data!.studentData!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return StudentShowCard(
                  student: provider.fStudentResponse!.data!.studentData![index],
                );
              },
            );
          default:
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return TeacherShowCard(
                    teacher: Teacher(),
                  );
                },
              ),
            );
        }
      }
      return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return StudentShowCard(
              student: Student(),
            );
          },
        ),
      );
    });
  }
}
