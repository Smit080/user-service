import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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

Future<List<String>> selectFiles() async {
  final ImagePicker picker = ImagePicker();

  List<XFile> list = await picker.pickMultiImage(
    maxHeight: 1920,
    maxWidth: 1920,
  );

  List<String> paths = [];

  for (XFile image in list) {
    if (getImageSize(File(image.path)) != null) {
      paths.add(image.path);
    }
  }
  if (list.length != paths.length) {
    showSnackBar(
      "Please select upto 2mb images only",
      color: Colors.red,
    );
  }
  return paths;
}

Future<String> selectFile() async {
  final ImagePicker picker = ImagePicker();

  XFile? img = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 1920,
    maxWidth: 1920,
  );

  String paths = "";

  if (img != null) {
    if (getImageSize(File(img.path)) != null) {
      paths = img.path;
    } else {
      showSnackBar(
        "Please select upto 2mb images only",
        color: Colors.red,
      );
    }
  }

  return paths;
}

String? getImageSize(File selectedImage) {
  final bytes = selectedImage.readAsBytesSync().lengthInBytes;
  final kb = bytes / 1024;
  if (kb < 2048) {
    return selectedImage.path;
  } else {
    return null;
  }
}

bool isCurrentMonth(DateTime date1, DateTime date2) {
  return date1.month == date2.month && date1.year == date2.year;
}
