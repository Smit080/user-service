import 'package:salon_user/app/utils/all_dependency.dart';

class ProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  DateTime? dob;
  String? gender;
  String? imgFile;
  String? imgUrl;
  String docScreen = AppStrings.aboutUs;
}
