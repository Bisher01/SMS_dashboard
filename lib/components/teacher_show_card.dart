import 'package:flutter/material.dart';

class TeacherShowCard extends StatefulWidget {
  const TeacherShowCard({Key? key}) : super(key: key);

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
                    Text(
                      "Teacher's name:",
                    ),
                    Text(
                      'joudi joudi',
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Teachers email',
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
