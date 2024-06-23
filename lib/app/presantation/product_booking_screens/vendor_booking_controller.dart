import 'package:salon_user/app/utils/all_dependancy.dart';

class VendorNBookingController extends GetxController {
  VendorNBookingController({this.isBookingScreen = false});
  bool isBookingScreen = false;
  int currentImg = 0;
  int currentServiceImg = 0;
  int selectedSpecialist = -1;
  List<int> selectedService = [];
  List<int> selectedServiceCat = [];
  List<DateTime> dateList = [];
  DateTime? selectedDate;
  String selectedTime = "";

  List<(String, String)> categoryList = [
    (AppAssets.hairIc, "Haircut"),
    (AppAssets.facialIc, "Facial"),
  ];

  List<String> dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thurday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  List<String> timeList = [
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
    "06:00 PM",
  ];

  void getDate() {
    dateList.clear();
    for (int i = 0; i < 30; i++) {
      dateList.add(DateTime.now().add(
        Duration(days: i),
      ));
    }
  }

  @override
  void onInit() {
    getDate();
    super.onInit();
  }
}
