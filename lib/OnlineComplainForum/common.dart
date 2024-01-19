import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class T_T extends StatelessWidget {
  const T_T(
      {super.key,
      required this.heading,
      required this.hint_text,
      this.keyboard_type,
      required this.SecondWidget,
      required this.function});
  final String heading;
  final String hint_text;
  final TextInputType? keyboard_type;
  final bool SecondWidget;
  final Function function;


// then, in the build method:

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            heading,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SecondWidget
            ? Container()
            : TextField(
                keyboardType: keyboard_type ?? TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: hint_text,
                  errorText: function(),
                ),
              ),
      ],
    );
  }
}
