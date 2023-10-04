import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onPressed,
    required this.text,
    this.enabled = true,
    this.mainBackColor = Constants.kPrimaryColor,
    this.height,
    this.icon,
  });
  final double? height;
  final void Function()? onPressed;
  final String text;
  final bool enabled;
  final Color mainBackColor;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          foregroundColor:
              enabled ? Colors.white : Constants.kButtunDisableTextColor,
          backgroundColor:
              enabled ? mainBackColor : Constants.kButtunDisableBackColor,
        ),
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                  color: enabled
                      ? Colors.white
                      : Constants.kButtunDisableTextColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  Text(
                    text,
                    style: TextStyle(
                      color: enabled
                          ? Colors.white
                          : Constants.kButtunDisableTextColor,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
