import 'package:flutter/material.dart';
import 'package:sms_dashboard/models/models.dart';

class TeacherShowCard extends StatefulWidget {
  final Teacher teacher;
  const TeacherShowCard({required this.teacher,Key? key}) : super(key: key);

  @override
  State<TeacherShowCard> createState() => _TeacherShowCardState();
}

class _TeacherShowCardState extends State<TeacherShowCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          //name email
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Teacher name'),
                    Text(
                      '${widget.teacher.f_name} ${widget.teacher.l_name}'
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Teachers email',
                    ),
                    Text(
                     '${widget.teacher.email}'
                    ),
                  ],
                ),
              ],
            ),
          ),
          //gender blood salary join date
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('teachers gender',),
                    Text('male',),
                  ],
                ),
                Column(
                  children: [
                    Text('teachers blood type',),
                    Text('O+',),
                  ],
                ),
                Column(
                  children: [
                    Text('teachers salary',),
                    Text('20 000',),
                  ],
                ),
                Column(
                  children: [
                    Text('teachers joining date',),
                    Text('21-5-2010',),
                  ],
                ),
              ],
            ),
          ),
          //address
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Country',),
                    Text('syria',),
                  ],
                ),
                Column(
                  children: [
                    Text('City',),
                    Text('damascus',),
                  ],
                ),
                Column(
                  children: [
                    Text('Location',),
                    Text('Malki',),
                  ],
                ),
              ],
            ),
          ),
          //subjects
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
