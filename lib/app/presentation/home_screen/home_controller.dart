import 'package:salon_user/app/utils/all_dependency.dart';

class HomeController extends GetxController {
  int currentServiceImg = 0;
  String selectedCat = "";
  List<int> selectedCatList = [];
  List<String> catList = ["All", "Haircut", "Facial"];

  List<(String, String)> categoryList = [
    (AppAssets.haircut, "Haircut"),
    (AppAssets.facial, "Facial"),
    // (AppAssets.facial, "Facial"),
  ];
}
