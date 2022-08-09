import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/models/models.dart';
import 'package:sms_dashboard/screens/screens.dart';
import '../providers/app_provider.dart';
import '../services/api_response.dart';
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
                    width: widgetSize.getWidth(120, context),
                    height: widgetSize.getHeight(160, context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                       'mentor.png',
                        fit: BoxFit.cover,
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
                    top: 15,
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
                                      text: widget.mentor[index].email!,
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return AddMentor(
                              mentor: widget.mentor[index],
                            );
                          }));
                    },
                    child: const Text(
                      "Edit this mentor's info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                //delete
                Padding(
                  padding: const EdgeInsets.only(
                    top: 17,
                  ),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete this mentor'),
                                content: const Text(
                                    'Are you sure you want to delete this mentor?'),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      final provider = Provider.of<AppProvider>(
                                          context,
                                          listen: false);
                                      if (await provider.checkInternet()) {
                                        var response =
                                            await provider.deleteMentor(
                                                widget.mentor[index].id!);
                                        if (response.status == Status.LOADING) {
                                          EasyLoading.showToast(
                                            'Loading...',
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                          );
                                        }
                                        if (response.status == Status.ERROR) {
                                          EasyLoading.showError(
                                              response.data!.message!,
                                              dismissOnTap: true);
                                        }
                                        if (response.status ==
                                            Status.COMPLETED) {
                                          if (response.data != null &&
                                              response.data!.status!) {
                                            EasyLoading.showSuccess(
                                                response.data!.message!,
                                                dismissOnTap: true);
                                            Provider.of<AppProvider>(context,
                                                    listen: false)
                                                .getAllMentors();
                                            Navigator.pop(context);
                                          }
                                        }
                                      } else {}
                                    },
                                    child: const Text(
                                      'delete',
                                      style: TextStyle(
                                        color: Color(0Xff2BC3BB),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'cancel',
                                      style: TextStyle(
                                        color: Color(0Xff2BC3BB),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.delete_outline_sharp,
                      )),
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
