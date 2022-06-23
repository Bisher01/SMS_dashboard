import 'package:flutter/material.dart';

class StudentShowCard extends StatefulWidget {
  const StudentShowCard({Key? key}) : super(key: key);

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
                      'joudi joudi',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'student email',
                    ),
                    Text(
                      'joudi.kab01@gmail.com',
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

        ],
      ),
    );
  }
}
