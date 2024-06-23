import 'package:salon_user/app/utils/all_dependancy.dart';

class DashboardController extends GetxController {
  int screenIndex = 0;
  List<Widget> screenList = [
    const HomeScreen(),
    Container(),
    Container(),
  ];
}
