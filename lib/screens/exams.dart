import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/providers/app_provider.dart';
import 'package:sms_dashboard/services/api_response.dart';
import '../../utill/widget_size.dart';

class ShowExams extends StatefulWidget {
  const ShowExams({Key? key}) : super(key: key);

  @override
  State<ShowExams> createState() => _ShowExamsState();
}

class _ShowExamsState extends State<ShowExams> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.getAllExamsResponse != null) {
        switch (provider.getAllExamsResponse?.status) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: provider.getAllExamsResponse!.data!.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: widgetSize.getWidth(200, context) /
                    widgetSize.getHeight(300, context),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: widgetSize.getWidth(200, context),
                    height: widgetSize.getHeight(400, context),
                    child: ExamCard(
                      exam: provider.getAllExamsResponse!.data!.data![index],
                    ),
                  ),
                );
              },
            );
          case Status.ERROR:
            return Error(
              errorMsg: provider.getAllExamsResponse!.message!,
            );
          default:
            return Container();
        }
      }
      return Container();
    });
  }
}
