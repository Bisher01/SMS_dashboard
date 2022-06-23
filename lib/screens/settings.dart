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
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: ListView(
        controller: ScrollController(),
        children: <Widget>[
          const Text(
            'School settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'School Logo',
                ),
                Image.asset(
                  '/back.jpg',
                  fit: BoxFit.scaleDown,
                  width: widgetSize.getWidth(100, context),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Logo',
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
                  child: const SettingsCard(
                    color: Colors.blue,
                    title: 'School name',
                    name: 'Awael',
                    button: 'Edit school name',
                  ),
                ),
                SizedBox(
                  width: widgetSize.getWidth(120, context),
                  height: widgetSize.getHeight(200, context),
                  child: const SettingsCard(
                    color: Colors.deepPurpleAccent,
                    title: 'School address',
                    name: 'address',
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
                  child: const SettingsCard(
                    color: Colors.red,
                    title: 'School email address',
                    name: '..email',
                  ),
                ),
                SizedBox(
                  width: widgetSize.getWidth(120, context),
                  height: widgetSize.getHeight(200, context),
                  child: const SettingsCard(
                    color: Colors.limeAccent,
                    title: 'School phone number',
                    name: '..phone',
                    button: 'Edit school phone number',
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
                  child: const SettingsCard(
                    color: Colors.pinkAccent,
                    title: 'Total number of students',
                    name: '109',
                  ),
                ),
                SizedBox(
                  width: widgetSize.getWidth(120, context),
                  height: widgetSize.getHeight(200, context),
                  child: const SettingsCard(
                    color: Colors.tealAccent,
                    title: 'Total number of teachers',
                    name: '20',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
