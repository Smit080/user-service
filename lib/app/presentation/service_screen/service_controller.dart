import 'package:salon_user/app/utils/all_dependency.dart';

class ServiceController extends GetxController {
  TextEditingController serviceName = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  int? serviceTime;
  TextEditingController serviceDesc = TextEditingController();
  List<String> businessImgList = [];

  String timeToString() {
    String time = "";
    if (serviceTime != null) {
      time = serviceTime! ~/ 60 == 0 ? "" : "${serviceTime! ~/ 60}hr ";
      time += serviceTime!.remainder(60) == 0
          ? ""
          : "${serviceTime!.remainder(60)}min";
    }
    return time;
  }
}
