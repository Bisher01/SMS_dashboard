import 'package:flutter/material.dart';

import '../models/models.dart';

class StudentShowCard extends StatefulWidget {
  final Student student;
  const StudentShowCard({required this.student,Key? key}) : super(key: key);

  @override
  State<StudentShowCard> createState() => _StudentShowCardState();
}

class _StudentShowCardState extends State<StudentShowCard> {
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
                    Text(
                      "student's name:",
                    ),
                    Text(
                      '${widget.student.f_name} ${widget.student.l_name}'
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'student email',
                    ),
                    Text(
                      '${widget.student.email}',
                    ),
                  ],
                ),
              ],
            ),
          ),
          //gender blood salary birth date
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('student gender',),
                    Text('male',),
                  ],
                ),
                Column(
                  children: [
                    Text('student blood type',),
                    Text('O+',),
                  ],
                ),
                Column(
                  children: [
                    Text('student salary',),
                    Text('20 000',),
                  ],
                ),
                Column(
                  children: [
                    Text('student birth date',),
                    Text('${widget.student.birthdate}',),
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

        ],
      ),
    );
  }
}
