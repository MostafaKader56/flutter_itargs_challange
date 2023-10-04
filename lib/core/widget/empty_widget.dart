import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/l10n.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class EmptyWidgetSample extends StatelessWidget {
  const EmptyWidgetSample({
    super.key,
    required this.onPressed,
    this.text,
    this.viewRetryBtn = false,
  });

  final void Function() onPressed;
  final String? text;
  final bool viewRetryBtn;
  @override
  Widget build(BuildContext context) {
    String tip;
    if (text != null) {
      tip = text!;
    } else {
      tip = S.current.no_data_exsist;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_data_1.png',
              width: SizeConfig.defaultSize! * 20,
            ),
          ],
        ),
        // SvgPicture.asset('assets/images/no_internet_svg.svg'),
        const SizedBox(height: 10),
        Text(
          tip,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        viewRetryBtn
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      S.current.retry,
                      style: const TextStyle(color: Constants.kPrimaryColor),
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
