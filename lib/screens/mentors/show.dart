import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/components/mentor_show_card.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/models.dart';
import '../../utill/widget_size.dart';

class ShowMentor extends StatefulWidget {
  const ShowMentor({Key? key}) : super(key: key);

  @override
  State<ShowMentor> createState() => _ShowMentorState();
}

class _ShowMentorState extends State<ShowMentor> {
  @override
  initState() {
    // Provider.of<AppProvider>(context, listen: false).getAllMentors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.fMentorResponse != null) {
        switch (provider.fMentorResponse?.status) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: provider.fMentorResponse!.data!.mentor!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: widgetSize.getWidth(200, context) /
                    widgetSize.getHeight(300, context),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.white70,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                content: SizedBox(
                                    width: widgetSize.getWidth(200, context),
                                    height:
                                        widgetSize.getHeight(400, context),
                                    child: MentorShowCard(
                                      mentor: provider
                                          .fMentorResponse!.data!.mentor!,
                                      selectedMentor: index,
                                    )),
                              );
                            });
                      },
                      child: MentorSmallCard(
                        mentor:
                            provider.fMentorResponse!.data!.mentor![index],
                      )),
                );
              },
            );
          case Status.ERROR:
            return Error(
              errorMsg: provider.fMentorResponse!.message!,
            );
          default:
            return Container();
        }
      }
      return Container();
    });
  }
}
