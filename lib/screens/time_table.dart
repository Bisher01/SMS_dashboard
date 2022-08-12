import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:sms_dashboard/utill/utill.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../models/models.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  TimeTableState createState() => TimeTableState();
}

class TimeTableState extends State<TimeTable> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _headController;
  ScrollController? _headController2;
  ScrollController? _bodyController;

  LinkedScrollControllerGroup? _linkedBodyControllers;
  ScrollController? _firstColumnController;
  ScrollController? _secondColumnController;
  ScrollController? _restColumnsController;
  List<LessonId> lessons = [];
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers!.addAndGet();
    _headController2 = _controllers!.addAndGet();
    _bodyController = _controllers!.addAndGet();

    _linkedBodyControllers = LinkedScrollControllerGroup();
    _firstColumnController = _linkedBodyControllers!.addAndGet();
    _restColumnsController = _linkedBodyControllers!.addAndGet();
    _secondColumnController = _linkedBodyControllers!.addAndGet();
  }

  @override
  void dispose() {
    _headController!.dispose();
    _bodyController!.dispose();
    _firstColumnController!.dispose();
    _secondColumnController!.dispose();
    _restColumnsController!.dispose();
    super.dispose();
  }

  final List<String> head = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int? classDDV;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AppProvider>(builder: (context, provider, child) {
        if (provider.classClassroomsResponse != null) {
          switch (provider.classClassroomsResponse!.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorResources.green,
                ),
              );
            case Status.COMPLETED:
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<int>(
                            hint: const Text('Class'),
                            value: classDDV,
                            items:
                            Provider.of<AppProvider>(context,listen: false).getSeedResponse!.data!.data![0].classes!
                                .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.name!),
                            ))
                                .toList(),
                            onChanged: (int? value) {
                              setState(() {
                                classDDV = value;
                                lessons.clear();
                                Provider.of<AppProvider>(context,listen: false).getClassClassrooms(classDDV!);
                              });
                            }),
                        OutlinedButton(onPressed: (){}, child: Text('submit',style: TextStyle(color: ColorResources.green),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.teal[400],
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Day',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            controller: _headController2,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(7, (index) {
                              return Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  border: const Border.symmetric(
                                      horizontal: BorderSide(
                                        width: 1,
                                        color: Colors.black12,
                                      ),
                                      vertical: BorderSide(
                                        width: 1,
                                        color: Colors.black26,
                                      )),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'room',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'teach',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.teal[200],
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'period',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            controller: _headController,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              49,
                              (index) {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.teal[200],
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    head[index % 7],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: 50,
                          child: ListView(
                            controller: _firstColumnController,
                            physics: const ClampingScrollPhysics(),
                            children: List.generate(
                                provider.classClassroomsResponse!.data!.data!
                                    .length, (index) {
                              return Container(
                                width: 50,
                                height: provider.classClassroomsResponse!.data!
                                        .data![index].teacher!.length *
                                    50,
                                decoration: BoxDecoration(
                                  color: Colors.teal[300],
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${provider.classClassroomsResponse!.data!.data![index].classrooms!.name!}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: ListView(
                            controller: _secondColumnController,
                            physics: const ClampingScrollPhysics(),
                            children: List.generate(
                                provider.getTeacherCount(
                                    provider.classClassroomsResponse!.data!),
                                (index) {
                              return Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  provider.getTeacherName(
                                      provider.classClassroomsResponse!.data!,
                                      index),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _bodyController,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            child: SizedBox(
                              width: (49) * 50,
                              child: ListView(
                                controller: _restColumnsController,
                                physics: const ClampingScrollPhysics(),
                                children: List.generate(
                                  provider.getTeacherCount(
                                      provider.classClassroomsResponse!.data!),
                                  (y) {
                                    return Row(
                                      children: List.generate(
                                        49,
                                        (x) {
                                          if (lessons.length <
                                              provider.getTeacherCount(provider
                                                      .classClassroomsResponse!
                                                      .data!) *
                                                  49) {
                                            lessons.add(LessonId(
                                                teacher_id: -1, id: -1));
                                          }
                                          int index = y * 49 + x;
                                          return InkWell(
                                            onTap: () {
                                              if (lessons[index].id == x &&
                                                  lessons[index].teacher_id ==
                                                      y) {
                                                setState(() {
                                                  lessons[index].id = -1;
                                                  lessons[index].teacher_id =
                                                      -1;
                                                });
                                              } else {
                                                setState(() {
                                                  lessons[index].id = x;
                                                  lessons[index].teacher_id = y;
                                                });
                                              }
                                            },
                                            child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 250),
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black12,
                                                      width: 1,
                                                    ),
                                                    color: lessons[index].id ==
                                                                x &&
                                                            lessons[index]
                                                                    .teacher_id ==
                                                                y
                                                        ? ColorResources.green
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 30,
                                                )),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            case Status.ERROR:
              return Error(
                errorMsg: provider.classClassroomsResponse!.message,
              );
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorResources.green,
                ),
              );
          }
        }
        return Container();
      }),
    );
  }
}
