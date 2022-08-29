import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  final String hint;
  final bool multiLine;
  final TextEditingController controller;

  const TextFormFiledWidget(
      {Key? key,
        required this.controller,
        required this.hint,
        required this.multiLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextFormField(
        minLines: multiLine ? 6 : 1,
        maxLines: multiLine ? 6 : 1,
        controller: controller,
        validator: (value) => value!.isEmpty ? "$hint Can't Be Empty" : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          hintText: '$hint',
        ),
      ),
    );
  }
}
