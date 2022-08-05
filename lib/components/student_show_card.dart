import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utill/widget_size.dart';

class StudentShowCard extends StatefulWidget {
  final List<Student> student;
  final int selectedStudent;
  const StudentShowCard(
      {required this.student, required this.selectedStudent, Key? key})
      : super(key: key);

  @override
  State<StudentShowCard> createState() => _StudentShowCardState();
}

class _StudentShowCardState extends State<StudentShowCard> {
  late PageController controller;
  @override
  initState() {
    controller = PageController(initialPage: widget.selectedStudent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.student.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.white70,
              ),
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Column(
              children: [
                //title
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    "Student's detailed information",
                    style: TextStyle(
                      color: Color(
                        0Xff2BC3BB,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //circle avatar
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: SizedBox(
                    width: widgetSize.getWidth(90, context),
                    height: widgetSize.getHeight(90, context),
                    child:  CircleAvatar(
                      backgroundImage: NetworkImage(
                        'http://127.0.0.1:8000/storage${widget.student[index].picture!}',
                      ),
                    ),
                  ),
                ),
                //name
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Name:",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '${widget.student[index].f_name} ${widget.student[index].l_name}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                //all student data
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //email code birthdate gender blood nationality
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SizedBox(
                              width: widgetSize.getWidth(90, context),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Email address: ",
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.student[index].email!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Code: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].code!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Birthdate: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].birthdate
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Gender: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].gender_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Blood type: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].blood_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Nationality: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].nationality_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //religion city town street class classroom
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Religion: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].religion_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "City: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].address!.city!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Town: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].address!.town!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Street: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        widget.student[index].address!.street!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Class: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].class_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Classroom: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].classroom_id
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Divider(
                    color: Colors.blueGrey,
                    thickness: 2,
                  ),
                ),
                //parents national number
                const Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    "Parent's info: ",
                    style: TextStyle(
                      color: Color(
                        0Xff2BC3BB,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "National number: ",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: widget.student[index].parent!.national_number!,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //mother phone
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Mother's name: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: widget
                                      .student[index].parent!.mother_name!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Father's name: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: widget
                                      .student[index].parent!.father_name!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Job: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.student[index].parent!.jop!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Phone number: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.student[index].parent!.phone!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: widgetSize.getWidth(50, context),
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Email Address: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.student[index].parent!.email!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Code: ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.student[index].parent!.code!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //edit
                Padding(
                  padding: const EdgeInsets.only(
                    top: 17,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(
                        0Xff2BC3BB,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Edit this student's info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
