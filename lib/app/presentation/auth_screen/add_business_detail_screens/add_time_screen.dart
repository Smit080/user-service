import 'package:salon_user/app/utils/all_dependency.dart';

class AddTimeScreen extends StatelessWidget {
  const AddTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();
    return controller.isSettingScreen
        ? Scaffold(
            backgroundColor: AppColor.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: p16, top: 8,right: p16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back_rounded),
                        ),
                        15.horizontal(),
                        const S24Text(AppStrings.yourBusinessHr),
                      ],
                    ),
                    15.vertical(),
                    widget(),
                  ],
                ),
              ),
            ),
          )
        : widget();
  }

  Widget widget() {
    AuthController controller = Get.find<AuthController>();
    return Expanded(
      child: ListView(
        primary: false,
        children: [
          if(!controller.isSettingScreen)
          const SText(
            AppStrings.yourBusinessHr,
            size: 26,
            fontWeight: FontWeight.w700,
          ),
          if(!controller.isSettingScreen)
          8.vertical(),
          if(!controller.isSettingScreen)
          const S14Text(AppStrings.whenClient),
          if(!controller.isSettingScreen)
          12.vertical(),
          const BusinessHrWidget(day: "Monday", time: "10:00 AM - 7:00 PM"),
          const BusinessHrWidget(day: "Tuesday", time: "10:00 AM - 7:00 PM"),
          const BusinessHrWidget(day: "Wednesday", time: "10:00 AM - 7:00 PM"),
          const BusinessHrWidget(day: "Thursday", time: "10:00 AM - 7:00 PM"),
          const BusinessHrWidget(day: "Friday", time: "10:00 AM - 7:00 PM"),
          const BusinessHrWidget(day: "Saturday", time: "Closed"),
          const BusinessHrWidget(day: "Sunday", time: "Closed"),
        ],
      ),
    );
  }
}
