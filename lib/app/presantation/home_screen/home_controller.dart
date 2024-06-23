import 'package:salon_user/app/utils/all_dependancy.dart';

class HomeController extends GetxController {
  int currentServiceImg = 0;
  String selectedCat = "";
  List<int> selectedCatList = [];
  List<String> catList = ["All", "Haircut", "Facial"];

  List<(String, String)> categoryList = [
    (AppAssets.hairIc, "Haircut"),
    (AppAssets.facialIc, "Facial"),
  ];
}
