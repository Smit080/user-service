import 'dart:developer';
import 'dart:io';
import 'package:salon_user/app/utils/all_dependency.dart';

class Helper {
  static void lightTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static void darkTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.primaryColor,
        statusBarColor: AppColor.primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static DateTime? currentBackPressTime;

  static void onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Double tap to exit");
    } else {
      exit(0);
    }
  }
}

/// common padd
const double p16 = 16;

extension Sizedbox on dynamic {
  SizedBox horizontal() {
    return SizedBox(width: this.toDouble());
  }

  SizedBox vertical() {
    return SizedBox(height: this.toDouble());
  }
}

extension Print on dynamic {
  void print() {
    log(this, name: AppStrings.appName);
  }
}

void showSnackBar(String message, {Color? color}) {
  Get.showSnackbar(
    GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color ?? AppColor.redColor,
      margin: const EdgeInsets.all(p16),
      borderRadius: 10,
      isDismissible: true,
    ),
  );
}
