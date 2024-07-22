import 'package:salon_user/app/utils/all_dependency.dart';

class StaffController extends GetxController {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController addPhone = TextEditingController();
  TextEditingController address = TextEditingController();
  DateTime? dob;
  DateTime? joinDate;
  bool isOnLeave = false;
  List<int> selectedService = [];
  String image = "";
  String selectedTab = AppStrings.personalDetail;
}
