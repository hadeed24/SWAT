import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class T_T extends StatelessWidget {
  const T_T(
      {super.key,
      required this.heading,
      required this.hint_text,
      this.keyboard_type,
      required this.SecondWidget});
  final String heading;
  final String hint_text;
  final TextInputType? keyboard_type;
  final bool SecondWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            heading,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SecondWidget
            ? Container()
            : TextField(
                keyboardType: keyboard_type ?? TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  border: OutlineInputBorder(),
                  hintText: hint_text,
                ),
              ),
      ],
    );
  }
}
