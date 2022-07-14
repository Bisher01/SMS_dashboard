import 'package:flutter/material.dart';
import 'package:sms_dashboard/models/models.dart';
import '../utill/widget_size.dart';

class MentorShowCard extends StatefulWidget {
  final List<Mentor> mentor;
  final int selectedMentor;
  const MentorShowCard(
      {required this.mentor, required this.selectedMentor, Key? key})
      : super(key: key);

  @override
  State<MentorShowCard> createState() => _MentorShowCardState();
}

class _MentorShowCardState extends State<MentorShowCard> {
  late PageController controller;
  @override
  initState() {
    controller = PageController(initialPage: widget.selectedMentor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: widget.mentor.length,
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
                    "Mentor's detailed information",
                    style: TextStyle(
                      color: Color(
                        0Xff2BC3BB,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //picture
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: SizedBox(
                    width: widgetSize.getWidth(90, context),
                    height: widgetSize.getHeight(90, context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.supervised_user_circle_outlined,
                        size: widgetSize.getWidth(25, context),
                        color: Colors.grey,
                      ),
                      // backgroundImage: AssetImage(
                      //   'back.jpg',
                      // ),
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
                        '${widget.mentor[index].f_name} ${widget.mentor[index].l_name}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                //all mentor data
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //email code join date gender religion
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
                                    text: "Email address: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].email!,
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
                                    text: "Code: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].code!,
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
                                    text: "Joining date: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].joining_date
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
                                    text: "Phone number: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].phone.toString(),
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
                      //grade salary city town street
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
                                    text: "Class: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].class_id
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
                                    text: widget.mentor[index].address_id
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
                                    text: "Town: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].address_id
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
                                    text: "Street: ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.mentor[index].address_id
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
                      "Edit this mentor's info",
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
