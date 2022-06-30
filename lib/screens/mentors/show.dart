import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/components/mentor_show_card.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/models.dart';

class ShowMentor extends StatefulWidget {
  const ShowMentor({Key? key}) : super(key: key);

  @override
  State<ShowMentor> createState() => _ShowMentorState();
}

class _ShowMentorState extends State<ShowMentor> {
  @override
  initState(){
    Provider.of<AppProvider>(context,listen: false).getAllMentors();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context,provider,child) {
          if(provider.fMentorResponse!=null){
            switch(provider.fMentorResponse?.status){
              case Status.LOADING:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ), itemBuilder: (BuildContext context, int index) {
                    return MentorShowCard(mentor: Mentor(),);
                  },
                  ),
                );
              case Status.COMPLETED:
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  itemCount: provider.fMentorResponse!.data!.mentor!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ), itemBuilder: (BuildContext context, int index) {
                  return MentorShowCard(mentor: provider.fMentorResponse!.data!.mentor![index],);
                },
                );
              case Status.ERROR:
                return Error(
                  errorMsg: provider.fMentorResponse!.message!,

                );
              default:
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ), itemBuilder: (BuildContext context, int index) {
                    return MentorShowCard(mentor: Mentor(),);
                  },
                  ),
                );
            }
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ), itemBuilder: (BuildContext context, int index) {
              return MentorShowCard(mentor: Mentor(),);
            },
            ),
          );

        }
    );
  }
}
