import 'package:salon_user/app/utils/all_dependancy.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController rePass = TextEditingController();
  bool obscureText = true;
  bool isRegister = false;
  bool reObscureText = true;
  Timer? timer;
  int otpTime = 60;

  void clearTap({bool isBack = false, bool isOtpClear = false, String? page}) {
    if (isBack) {
      Get.back();
    } else {
      if (page != null) {
        Get.toNamed(page);
      }
    }
    if (isOtpClear) {
      if (timer != null) {
        timer!.cancel();
      }
    } else {
      email.clear();
      pass.clear();
      obscureText = true;
    }
    update();
  }

  void startTimer() {
    otpTime = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (otpTime != 0) {
        otpTime--;
        update();
      } else {
        "-->>> $otpTime".print();
        timer!.cancel();
        update();
      }
    });
  }

  String getDuration() {
    Duration time = Duration(seconds: otpTime);
    return "${time.inMinutes > 9 ? time.inMinutes : "0${time.inMinutes}"}"
        ":${time.inSeconds.remainder(60) > 9 ? time.inSeconds.remainder(60) : ""
            "0${time.inSeconds.remainder(60)}"}";
  }
}
