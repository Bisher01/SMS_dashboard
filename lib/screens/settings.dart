import 'package:flutter/material.dart';
import 'package:sms_dashboard/components/components.dart';
import 'package:sms_dashboard/utill/widget_size.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'School Logo',
          ),
          Row(
            children: <Widget>[
              Image.asset(
                '/back.jpg',
                fit: BoxFit.scaleDown,
                width: widgetSize.getWidth(100, context),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit Logo',
                ),
              ),
            ],
          ),
          SettingsCard(
            color: Colors.blue,
            title: 'School name',
            name: 'Awael',
            button: 'Edit school name',
          ),
          SettingsCard(
            color: Colors.deepPurpleAccent,
            title: 'School address',
            name: 'address',
            button: 'Edit school address',
          ),

          Text(
            'School Email',
          ),
          Text(
            '.... email',
          ),
          SettingsCard(
            color: Colors.limeAccent,
            title: 'School phone number',
            name: '..phone',
            button: 'Edit school phone number',
          ),
        ],
      ),
    );
  }
}
