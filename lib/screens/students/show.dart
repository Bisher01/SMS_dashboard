import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_dashboard/providers/providers.dart';
import 'package:sms_dashboard/services/api_response.dart';
import 'package:sms_dashboard/utill/utill.dart';
import '../../components/components.dart';
import '../../models/models.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({Key? key}) : super(key: key);

  @override
  State<ShowStudent> createState() => _ShowStudentState();
}

class _ShowStudentState extends State<ShowStudent> {
  late TextEditingController _searchController ;
  @override
  initState() {
    _searchController = TextEditingController();
    // Provider.of<AppProvider>(context, listen: false).getAllStudents();
    super.initState();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
/// TODO : add error builder
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        TextField(
          controller: _searchController,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) {
            if (_searchController.text.isNotEmpty) {
              Provider.of<AppProvider>(context,
                  listen: false)
                  .getAllStudents(name: _searchController.text);
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {_searchController.clear();
                        Provider.of<AppProvider>(context,
                            listen: false)
                            .getAllStudents();

                    },
                    child: Icon(
                      Icons.cancel,
                      color: Colors.grey[400],
                    )),
                InkWell(
                    onTap: () {
                      if (_searchController.text.isNotEmpty) {
                        Provider.of<AppProvider>(context,
                            listen: false)
                            .getAllStudents(name: _searchController.text);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                    )),
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintStyle: TextStyle(color: Colors.grey[400]),
            hintText: 'Search',
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.transparent, width: 0)),
            enabledBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.transparent, width: 0)),
            disabledBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.transparent, width: 0)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.transparent, width: 0)),
          ),
        ),
        Expanded(
          child: Consumer<AppProvider>(builder: (context, provider, child) {
            if (provider.fStudentResponse != null) {
              switch (provider.fStudentResponse?.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.ERROR:
                  return Error(
                    errorMsg: provider.fStudentResponse!.message!,
                  );
                case Status.COMPLETED:
                  return Container(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      controller: ScrollController(),
                      itemCount: provider.fStudentResponse!.data!.student!.length,
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
                                        width: widgetSize.getWidth(250, context),
                                        height: widgetSize.getHeight(680, context),
                                        child: StudentShowCard(
                                            selectedStudent: index,
                                            student: provider
                                                .fStudentResponse!.data!.student!),
                                      ),
                                    );
                                  });
                            },
                            child: StudentSmallCard(
                              student:
                                  provider.fStudentResponse!.data!.student![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                default:
                  return Container();
              }
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
