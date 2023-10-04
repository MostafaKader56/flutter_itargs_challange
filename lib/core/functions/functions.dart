import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../errors/response_error.dart';
import '../repo/shared_pref_helper.dart';
import '../utils/app_router.dart';
import '../utils/constants.dart';

class Functions {
  static bool isEmailValid(String email) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    // Check if the phone number starts with a '+' or a digit
    if (!RegExp(r'^[+\d]').hasMatch(phoneNumber)) {
      return false;
    }

    // Check if the phone number contains only digits
    if (!RegExp(r'^[+\d]+$').hasMatch(phoneNumber)) {
      return false;
    }

    // You can add additional length validation if needed
    // For example, to validate that the phone number is between 10 and 15 digits:
    if (phoneNumber.length < 10 || phoneNumber.length > 15) {
      return false;
    }

    return true;
  }

  static String getMoneyFromDouble(double value) {
    String formattedValue = NumberFormat('#,##0.##', 'en_US').format(value);
    if (value == value.floor()) {
      formattedValue = formattedValue.split('.')[0];
    }
    return formattedValue;
  }

  static String getIntegerWithComma(int value) {
    String formattedValue = NumberFormat('#,##0.##', 'en_US').format(value);
    if (value == value.floor()) {
      formattedValue = formattedValue.split('.')[0];
    }
    return formattedValue;
  }

  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void showToastIfMessageNotNull(String? message) {
    if (message == null) {
      return;
    }
    showToast(message);
  }

  static bool isUnAuth(ResponseError responseError) {
    return (responseError.errors
                ?.containsKey(Constants.kUnauthenticatedErrorResponseKey) ??
            false) &&
        (responseError.errors?[Constants.kUnauthenticatedErrorResponseKey][0] ==
            1);
  }

  // static void showToast(BuildContext context, String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(text),
  //   ));
  // }

  static void showAlerDialog({
    bool dismissible = true,
    required String title,
    required String message,
    required String buttonOneText,
    String? buttonTwoText,
    String? buttonThreeText,
    void Function()? onButtonOnePressed,
    void Function()? onButtonTwoPressed,
    void Function()? onButtonThreePressed,
  }) {
    showDialog(
      context: AppRouter.navigatorKey.currentContext!,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => dismissible,
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(buttonOneText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onButtonOnePressed?.call();
                },
              ),
              buttonTwoText != null
                  ? TextButton(
                      child: Text(buttonTwoText),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onButtonTwoPressed?.call();
                      },
                    )
                  : Container(),
              buttonThreeText != null
                  ? TextButton(
                      child: Text(buttonThreeText),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onButtonThreePressed?.call();
                      },
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  static void showShouldLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('This feature requires login.'),
          actions: [
            TextButton(
              child: const Text('Ignore'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.of(context).pop();
                // GoRouter.of(context).push(AppRouter.kSignInView);
              },
            ),
            TextButton(
              child: const Text('Sign Up'),
              onPressed: () {
                Navigator.of(context).pop();
                // GoRouter.of(context).push(AppRouter.kSignUpView);
              },
            ),
          ],
        );
      },
    );
  }

  static String getTimeFromTimeStamp(int timeStamp) {
    return DateFormat('dd/MM/yyyy hh:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(
      timeStamp,
      isUtc: true,
    ).toLocal());
  }

  static String getDateFromTimeStamp(int timeStamp) {
    return DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(
      timeStamp,
      isUtc: true,
    ).toLocal());
  }

  static bool isTimestampTodayOrFuture(int millisecondsTimestamp) {
    // Convert milliseconds timestamp to DateTime
    DateTime timestampDate =
        DateTime.fromMillisecondsSinceEpoch(millisecondsTimestamp, isUtc: true);

    // Get current date
    DateTime currentDate = DateTime.now().toUtc();

    // Compare dates
    if (timestampDate.year > currentDate.year ||
        (timestampDate.year == currentDate.year &&
            timestampDate.month > currentDate.month) ||
        (timestampDate.year == currentDate.year &&
            timestampDate.month == currentDate.month &&
            timestampDate.day >= currentDate.day)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> showExtemistLoadingDialog(
      BuildContext context, String text) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevent the user from dismissing the dialog by pressing the back button
          child: AlertDialog(
            content: Row(
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(width: 20),
                Text(text),
              ],
            ),
          ),
        );
      },
    );
  }

  static bool? getIsDarkMode() {
    return SharedPrefsHelper.getIsDarkMode();
  }

  static void setIsDarkMode(BuildContext context, bool newIsDarkMode) {
    MyApp.setTheme(context, newIsDarkMode);
    SharedPrefsHelper.setIsDarkMode(newIsDarkMode);
  }

  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static void changeLocale(BuildContext context, String localeSuffix) {
    SharedPrefsHelper.setLangSuffix(localeSuffix);
    MyApp.setLocale(
      context,
      Locale(
        localeSuffix,
        '',
      ),
    );
  }

  static Locale? getLocale() {
    String? suffix = SharedPrefsHelper.getLangSuffix();
    if (suffix != null) {
      return Locale(
        suffix,
        '',
      );
    }
    return null;
  }

  static bool isTimeStampMoreThan30MiutesOld(
      {required int timestampMilliseconds}) {
    // Create a DateTime object from the timestamp
    DateTime timestamp =
        DateTime.fromMillisecondsSinceEpoch(timestampMilliseconds, isUtc: true);

    // Get the current time
    DateTime currentTime = DateTime.now().toUtc();

    // Calculate the time difference as a Duration
    Duration difference = currentTime.difference(timestamp);

    // Check if the difference is greater than 30 minutes (1800 seconds)
    if (difference.inSeconds > 1800) {
      return true;
    } else {
      return false;
    }
  }

  static String getTimestampId() {
    final random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String id = '';

    for (int i = 0; i < 5; i++) {
      id += chars[random.nextInt(chars.length)];
    }

    DateTime currentTime = DateTime.now().toUtc();
    return currentTime.millisecondsSinceEpoch.toString() + id;
  }

  static int getTimestampUtc() {
    DateTime currentTime = DateTime.now().toUtc();
    return currentTime.millisecondsSinceEpoch;
  }
}
