import 'package:salon_user/app/utils/all_dependency.dart';

class BottomBookNowWidget extends StatelessWidget {
  final bool? isServiceList;
  const BottomBookNowWidget({super.key, this.isServiceList = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 0),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom / 2,
          ),
          child: GetBuilder<VendorNBookingController>(
            builder: (controller) {
              return ColoredBox(
                color: AppColor.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: p16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: controller.selectedService.isEmpty
                            ? const S16Text("10 ${AppStrings.serviceAvailable}")
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const S16Text(
                                        "Total",
                                        color: AppColor.grey100,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      S16Text(
                                        " (${controller.selectedService.length}"
                                        " ${controller.selectedService.length == 1 ? ""
                                            "Service" : "Services"})",
                                        color: AppColor.grey80,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  const SText(
                                    "₹1500",
                                    size: 18,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              ),
                      ),
                      Expanded(
                        flex: 4,
                        child: CommonBtn(
                          text: isServiceList != null
                              ? AppStrings.bookNow
                              : AppStrings.checkout,
                          onTap: () {
                            if (isServiceList != null) {
                              if (isServiceList!) {
                                if (controller.selectedService.isEmpty) {
                                  showSnackBar(AppStrings.selectOneService);
                                } else {
                                  Get.toNamed(AppRoutes.bookService);
                                }
                              } else {
                                Get.toNamed(AppRoutes.serviceList);
                              }
                            } else {
                              if (controller.selectedSpecialist == -1) {
                                showSnackBar(AppStrings.selectSpecialist);
                              } else if (controller.selectedDate == null) {
                                showSnackBar(AppStrings.selectDate);
                              } else if (controller.selectedTime.isEmpty) {
                                showSnackBar(AppStrings.selectTime);
                              } else {
                                Get.toNamed(AppRoutes.bookingCheckout);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
