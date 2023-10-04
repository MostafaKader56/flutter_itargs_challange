import 'package:flutter/material.dart';
import 'package:flutter_itargs_challange/core/functions/functions.dart';
import 'package:flutter_itargs_challange/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.Settings,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SettingItemSwitch(
            title: S.current.Arabic_language,
            initialValue: Functions.isArabic(),
            onValueChanged: (asd) {
              Functions.changeLocale(context, asd ? 'ar' : 'en');
              GoRouter.of(context).pushReplacement(
                AppRouter.kHomeView,
                extra: true,
              );
            },
          ),
          SettingItemSwitch(
            title: S.current.dark_mode,
            initialValue: Functions.getIsDarkMode() ?? false,
            onValueChanged: (asd) {
              Functions.setIsDarkMode(context, asd);
              // GoRouter.of(context).pushReplacement(
              //   AppRouter.kHomeView,
              //   extra: true,
              // );
            },
          ),
        ],
      ),
    );
  }
}

class SettingItemSwitch extends StatefulWidget {
  const SettingItemSwitch({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onValueChanged,
  });

  final String title;
  final bool initialValue;
  final void Function(bool) onValueChanged;

  @override
  State<SettingItemSwitch> createState() => _SettingItemSwitchState();
}

class _SettingItemSwitchState extends State<SettingItemSwitch> {
  late bool switchValue;
  @override
  void initState() {
    super.initState();
    switchValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSwitchOnChanged();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Switch(
            value: switchValue,
            onChanged: (newValue) {
              onSwitchOnChanged();
            },
          ),
        ],
      ),
    );
  }

  void onSwitchOnChanged() {
    bool newValue = !switchValue;
    widget.onValueChanged(newValue);
    setState(() {
      switchValue = newValue;
    });
  }
}
