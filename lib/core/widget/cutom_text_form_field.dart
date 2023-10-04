import 'package:flutter/material.dart';

class CutomTextField extends StatelessWidget {
  const CutomTextField({
    super.key,
    required this.hint,
    required this.title,
    required this.textInputType,
    required this.onChanged,
    this.errorMsg,
    this.optional = false,
    this.lines = 1,
    this.fieldInitialValue,
  });

  final String? fieldInitialValue;
  final bool optional;
  final int lines;
  final String hint;
  final String title;
  final TextInputType textInputType;
  final Function(String value) onChanged;
  final String? errorMsg;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              optional
                  ? const Text(
                      'Optional',
                      style: TextStyle(color: Colors.grey, fontSize: 9),
                    )
                  : Container(),
            ],
          ),
        ),
        TextFormField(
          focusNode: null,
          onChanged: onChanged,
          initialValue: fieldInitialValue,
          keyboardType: textInputType,
          cursorColor: Colors.black,
          maxLines: lines,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          decoration: InputDecoration(
              isDense: true,
              helperText: ' ',
              errorText: errorMsg,
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: hint,
              focusedBorder: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
              )),
        ),
      ],
    );
  }
}
