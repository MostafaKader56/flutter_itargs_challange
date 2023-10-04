import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/l10n.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class ErrorWidgetSample extends StatelessWidget {
  const ErrorWidgetSample(
      {super.key,
      required this.onPressed,
      this.text = 'No Internet Connection'});

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_internet_1.png',
              width: SizeConfig.defaultSize! * 20,
            ),
          ],
        ),
        // SvgPicture.asset('assets/images/no_internet_svg.svg'),
        const SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Row(
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
      ],
    );
  }
}
