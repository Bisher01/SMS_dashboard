import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/utill/widget_size.dart';

import '../providers/app_provider.dart';
import '../services/api_response.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<Color> cardColor = [
    const Color.fromRGBO(242, 216, 199, 1),
    const Color.fromRGBO(244, 230, 202, 1),
    const Color.fromRGBO(225, 174, 86, 1),
    const Color.fromRGBO(148, 111, 169, 1)
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.getSettingsResponse != null) {
          switch (provider.getSettingsResponse!.status) {
            case Status.LOADING:
              return const Center(child: Text('loading'));
            case Status.COMPLETED:
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 50),
                controller: ScrollController(),
                children: <Widget>[
                  const Center(
                    child: Text(
                      'School settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: SizedBox(
                      height: widgetSize.getHeight(300, context),
                      child: FadeInImage(
                        fit: BoxFit.fitHeight,
                        placeholder: const AssetImage('assets/college.png'),
                        image: NetworkImage(
                            'http://127.0.0.1:8000/storage/${provider.getSettingsResponse!.data!.logo}'),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(
                              child: Image.asset("assets/college.png"));
                        },

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: widgetSize.getWidth(120, context),
                          height: widgetSize.getHeight(200, context),
                          child: SettingsCard(
                            settings: provider.getSettingsResponse!.data,
                            color: cardColor[3],
                            title: 'School name',
                            name:
                                '${provider.getSettingsResponse!.data!.name}',
                            button: 'Edit school name',
                          ),
                        ),
                        SizedBox(
                          width: widgetSize.getWidth(120, context),
                          height: widgetSize.getHeight(200, context),
                          child: SettingsCard(
                            settings: provider.getSettingsResponse!.data,
                            color: cardColor[0],
                            title: 'School address',
                            name:
                                '${provider.getSettingsResponse!.data!.address!.city}-${provider.getSettingsResponse!.data!.address!.town}-${provider.getSettingsResponse!.data!.address!.street}',
                            button: 'Edit school address',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: widgetSize.getWidth(120, context),
                          height: widgetSize.getHeight(200, context),
                          child:  SettingsCard(
                            settings: provider.getSettingsResponse!.data,
                            color: cardColor[1],
                            title: 'School email address',
                            name: '${provider.getSettingsResponse!.data!.admin!.email}',
                            button: 'Edit school email',
                          ),
                        ),
                        SizedBox(
                          width: widgetSize.getWidth(120, context),
                          height: widgetSize.getHeight(200, context),
                          child:  SettingsCard(
                            settings: provider.getSettingsResponse!.data,
                            color: cardColor[2],
                            title: 'School phone number',
                            name: '${provider.getSettingsResponse!.data!.phone}',
                            button: 'Edit school phone number',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            case Status.ERROR:
              return Center(
                  child:
                      Text(provider.getSettingsResponse!.message!.toString()));
            default:
              return const Center(child: Text('def'));
          }
        }
        return const Center(child: Text('else'));
      },
    );
  }
}
