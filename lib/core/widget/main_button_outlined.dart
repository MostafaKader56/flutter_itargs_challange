import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainButtonOutlined extends StatelessWidget {
  const MainButtonOutlined({
    super.key,
    this.onPressed,
    required this.text,
    this.outlineColor = Constants.kPrimaryColor,
    this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color outlineColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(color: outlineColor, width: 1.5),
          foregroundColor: outlineColor,
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
