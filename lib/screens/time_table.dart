import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import '../../utill/widget_size.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Cell extends StatelessWidget {
  final dynamic value;
  final Color? color;
  final Color? borderColor;
  final bool head;
  final bool top;
  const Cell({
    Key? key,
    this.value,
    this.color,
    this.borderColor,
    required this.head,
    required this.top,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor ?? Colors.black12,
            width: 1,
          ),
          borderRadius: top
              ? BorderRadius.zero
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
      alignment: Alignment.center,
      child: Text(
        '${value ?? ''}',
        style: head
            ? TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              )
            : const TextStyle(
                fontSize: 16.0,
              ),
      ),
    );
  }
}

class Head2 extends StatelessWidget {
  final ScrollController? scrollController;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  Head2({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'day',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(7, (index) {
                  return Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange[400],
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      days[index],
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[800],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Head extends StatelessWidget {
  final List<String> head = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
  ];
  final ScrollController? scrollController;
  Head({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Cell(
            value: "DAY",
            head: true,
            color: Colors.orange[400],
            top: true,
          ),
          Expanded(
            child: Container(
              child: ListView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(49, (index) {
                  return Cell(
                    value: head[index%7],
                    head: true,
                    top: true,
                    color: Colors.orange[400],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  final ScrollController? scrollController;
  const Body({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  initState() {
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers!.addAndGet();
    _restColumnsController = _controllers!.addAndGet();
    super.initState();
  }

  LinkedScrollControllerGroup? _controllers;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnsController;

  @override
  void dispose() {
    _firstColumnController!.dispose();
    _restColumnsController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 50,
          child: ListView(
            controller: _firstColumnController,
            physics: const ClampingScrollPhysics(),
            children: List.generate(49, (index) {
              return Cell(
                value: index,
                color: Colors.orange[100],
                top: false,
                head: true,
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Container(
              width: (49) * 50,
              child: ListView(
                controller: _restColumnsController,
                physics: const ClampingScrollPhysics(),
                children: List.generate(49, (y) {
                  return Row(
                    children: List.generate(49, (x) {
                      return Cell(top: true, head: false, value: x + 1);
                    }),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _headController;
  ScrollController? _headController2;
  ScrollController? _bodyController;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers!.addAndGet();
    _headController2 = _controllers!.addAndGet();
    _bodyController = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _headController!.dispose();
    _bodyController!.dispose();
    super.dispose();
  }

  List<String> seasons = ['Season 1', 'Season 2'];
  int seasonId = 0;
  String? selectedSeason;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Head2(scrollController: _headController2),
              Head(
                scrollController: _headController,
              ),
              Expanded(
                child: Body(
                  scrollController: _bodyController,
                ),
              ),
            ],
          ),
        ),Column(children: [
            Draggable(child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                  ),
                 ),
              alignment: Alignment.center,
              child: Text(
                '1',
                style:
                    TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
            ), feedback: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '1',
                style:
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
            ))
        ],)],
      ),
    );
  }
}
