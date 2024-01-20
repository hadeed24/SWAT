import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class T_T extends StatelessWidget {
  T_T({
    super.key,
    required this.heading,
    required this.hint_text,
    this.keyboard_type,
    required this.SecondWidget,
    required TextEditingController controller,
    required this.maxlength,
  }) : controller = controller;

  final String heading;
  final String hint_text;
  final TextInputType? keyboard_type;
  final bool SecondWidget;
  final TextEditingController controller;
  final int maxlength;
  String? get errorText {
// at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
// Note: you can do your own custom validation here
// Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
// return null if the text is valid
    return null;
  }
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
            : TextFormField(
              
                maxLength: maxlength, // Set the maximum length
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                buildCounter: (BuildContext context,
                    {required int currentLength,
                    required bool isFocused,
                    required int? maxLength}) {
                  return const SizedBox();
                },
                controller: controller,
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
                ),
              ),
      ],
    );
  }
}
