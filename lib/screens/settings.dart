import 'package:flutter/material.dart';
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
                width: widgetSize.getWidth(100,context),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit Logo',
                ),
              ),
            ],
          ),
          Text(
            'School name',
          ),
          Row(
            children: <Widget>[
              //TextField(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit name',
                ),
              ),
            ],
          ),
          Text(
            'School address',
          ),
          Text(
            '.... address',
          ),
          Text(
            'School Email',
          ),
          Text(
            '.... email',
          ),
          Text(
            'School phone number',
          ),
          Text(
            '.... number',
          ),
        ],
      ),
    );
  }
}
