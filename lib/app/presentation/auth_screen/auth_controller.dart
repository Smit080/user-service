import 'package:salon_user/app/utils/all_dependency.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController rePass = TextEditingController();
  bool isSettingScreen = false;
  String logoImg = "";

  /// add business detail screen variable
  TextEditingController businessName = TextEditingController();
  TextEditingController businessDesc = TextEditingController();
  TextEditingController businessAddress = TextEditingController();
  String teamSize = "1";
  List<String> businessImgList = [];
  bool isClose = false;
  List<String> toTimeList = [];
  String selectedToTime = "10:00 AM";
  String selectedFromTime = "07:00 PM";
  List<String> breaksList = [];

  void addTime() {
    toTimeList.clear();
    for (int i = 0; i < 288; i++) {
      Duration duration = Duration(
        hours: i ~/ 12,
        minutes: (i.remainder(12) + 1) * 5,
      );
      DateTime dateTime = DateTime(0, 1, 1).add(duration);
      String formattedTime = DateFormat('hh:mm a').format(dateTime);
      toTimeList.add(formattedTime);
    }
  }

  // void addFromTime() {
  //   fromTimeList.clear();
  //   for (int i = 0; i < 288; i++) {
  //     int index = toTimeList.indexOf(selctedToTime);
  //     if (index < i) {
  //       fromTimeList.add(toTimeList[i]);
  //     }
  //   }
  //   selctedFromTime = fromTimeList.contains(selctedFromTime)
  //       ? selctedFromTime
  //       : fromTimeList.first;
  //   update();
  // }

  bool obscureText = true;
  bool isRegister = false;
  bool reObscureText = true;
  Timer? timer;
  int otpTime = 60;
  double indicatorValue = (1 / 3);

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

  List<(String, String)> categoryList = [
    (AppAssets.hairIc, "Haircut"),
    (AppAssets.facialIc, "Facial"),
  ];

  List<String> selectedCat = [];

  @override
  void onInit() {
    addTime();
    super.onInit();
  }
}
