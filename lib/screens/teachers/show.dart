import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/models.dart';

class ShowTeacher extends StatefulWidget {
  const ShowTeacher({Key? key}) : super(key: key);

  @override
  State<ShowTeacher> createState() => _ShowTeacherState();
}

class _ShowTeacherState extends State<ShowTeacher> {
  @override
  initState(){
    Provider.of<AppProvider>(context,listen: false).getAllTeachers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context,provider,child) {
        if(provider.fTeacherResponse!=null){
          switch(provider.fTeacherResponse?.status){
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
                  ), itemBuilder: (BuildContext context, int index) {
                  return TeacherShowCard(teacher: Teacher(),);
                },
                ),
              );
            case Status.COMPLETED:
              return GridView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                itemCount: provider.fTeacherResponse!.data!.teacherData!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ), itemBuilder: (BuildContext context, int index) {
                return TeacherShowCard(teacher: provider.fTeacherResponse!.data!.teacherData![index],);
              },
              );
            case Status.ERROR:
              return Error(
                errorMsg: provider.fTeacherResponse!.message!,

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
                  ), itemBuilder: (BuildContext context, int index) {
                  return TeacherShowCard(teacher: Teacher(),);
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
            ), itemBuilder: (BuildContext context, int index) {
            return TeacherShowCard(teacher: Teacher(),);
          },
          ),
        );

      }
    );
  }
}
