import 'package:salon_user/app/utils/all_dependancy.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
    super.onInit();
  }
}

class DetailScreenController extends GetxController {
  RxInt screenIndex = 0.obs;
  PageController pageController = PageController();

  List<(String, String)> screenContent = [
    (AppAssets.detailFind1, AppStrings.findBarber),
    (AppAssets.detailBook, AppStrings.bookYrFav),
    (AppAssets.detail3, AppStrings.comeBeHandsome),
  ];
}
