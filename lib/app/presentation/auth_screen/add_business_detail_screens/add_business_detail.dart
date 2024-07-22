import '../../../utils/all_dependency.dart';

class AddBusinessDetail extends StatelessWidget {
  const AddBusinessDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.all(p16),
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return CommonBtn(
                  borderRad: 10,
                  borderColor: AppColor.grey100,
                  btnColor: AppColor.grey100,
                  text: controller.indicatorValue == 1
                      ? AppStrings.signIn
                      : AppStrings.continues,
                  onTap: () {
                    if (controller.indicatorValue == 1 / 3) {
                      controller.indicatorValue = 2 / 3;
                    } else if (controller.indicatorValue == 2 / 3) {
                      controller.indicatorValue = 1;
                    } else {
                      Get.offAllNamed(AppRoutes.dashboardScreen);
                    }
                    controller.update();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: LinearProgressIndicator(
                      value: controller.indicatorValue,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: controller.indicatorValue == (1 / 3)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.indicatorValue != (1 / 3))
                        GestureDetector(
                          onTap: () {
                            if (controller.indicatorValue == 2 / 3) {
                              controller.indicatorValue = 1 / 3;
                            } else if (controller.indicatorValue == 1) {
                              controller.indicatorValue = 2 / 3;
                            }
                            controller.update();
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 25,
                            color: AppColor.grey100,
                          ),
                        ),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(AppRoutes.loginScreen),
                        child: const S16Text(
                          AppStrings.logout,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  20.vertical(),
                  if (controller.indicatorValue == 1 / 3)
                    const SelectCategoryScreen()
                  else if (controller.indicatorValue == 2 / 3)
                    const AddDetailScreen()
                  else
                    const AddTimeScreen()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
