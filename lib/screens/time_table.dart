import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:sms_dashboard/utill/utill.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

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
  List<String> seasons = ['Season 1', 'Season 2'];
  int seasonId = 0;
  String? selectedSeason;

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
                                  border:  const Border.symmetric(
                                      horizontal: BorderSide(
                                        width: 1,
                                        color: Colors.black12,
                                      ),
                                      vertical: BorderSide(
                                        width: 1,color: Colors.black26,
                                      )
                                  ),
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
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black12,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.zero
                                                    ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              '',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
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
