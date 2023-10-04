import 'package:flutter/material.dart';

class CutomOutlinedPasswordTextField extends StatefulWidget {
  const CutomOutlinedPasswordTextField({
    super.key,
    required this.label,
    this.helperText = ' ',
    this.hint,
    this.errorMsg,
    this.isDense,
    this.contentPadding,
    this.textInputType,
    required this.controller,
    this.enabledColor = Colors.grey,
    this.focusedColor = Colors.black,
  });

  final String label;
  final String helperText;
  final String? hint;
  final String? errorMsg;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? textInputType;
  final TextEditingController controller;

  final Color enabledColor;
  final Color focusedColor;

  @override
  State<CutomOutlinedPasswordTextField> createState() =>
      _CutomOutlinedPasswordTextFieldState();
}

class _CutomOutlinedPasswordTextFieldState
    extends State<CutomOutlinedPasswordTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: null,
      cursorColor: Colors.black,
      keyboardType: widget.textInputType,
      obscureText: !_passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            minimumSize: Size.zero, // Set this
            padding: EdgeInsets.zero, // and this
          ),
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: widget.enabledColor,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        isDense: widget.isDense,
        helperText: widget.helperText,
        errorText: widget.errorMsg,
        label: Text(
          widget.label,
          style: TextStyle(
            color: widget.focusedColor,
          ),
        ),
        contentPadding: widget.contentPadding,
        hintStyle: TextStyle(color: widget.enabledColor),
        hintText: widget.hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.focusedColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.enabledColor, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
