import 'package:salon_user/app/presantation/booking_screens/booking_screen.dart';
import 'package:salon_user/app/utils/all_dependancy.dart';

class DashboardController extends GetxController {
  int screenIndex = 0;
  List<Widget> screenList = [
    const HomeScreen(),
    const LocationScreen(),
    const BookingScreen(),
  ];
}
