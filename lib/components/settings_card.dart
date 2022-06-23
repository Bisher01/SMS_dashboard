import 'package:flutter/material.dart';

class SettingsCard extends StatefulWidget {
  final Color color;
  final String title;
  final String name;
  final String? button;
  const SettingsCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.name,
      this.button})
      : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.color),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
          ),
          Text(widget.name),
          if (widget.button != null)
            TextButton(
              onPressed: () {},
              child: Text(
                widget.button!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
