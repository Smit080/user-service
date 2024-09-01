import 'package:salon_user/app/utils/all_dependency.dart';

class BookingScreen extends GetView<BookingController> {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: p16),
              child: S24Text(AppStrings.myBooking),
            ),
            20.vertical(),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: p16),
                child: Row(
                  children: [
                    Expanded(
                      child: CategoryWidget(
                        onTap: () => controller.selectedBooking.value =
                            AppStrings.upcoming,
                        cat: AppStrings.upcoming,
                        isSelected: controller.selectedBooking.value ==
                            AppStrings.upcoming,
                        isBookingScreen: true,
                      ),
                    ),
                    10.horizontal(),
                    Expanded(
                      child: CategoryWidget(
                        onTap: () => controller.selectedBooking.value =
                            AppStrings.completed,
                        cat: AppStrings.completed,
                        isSelected: controller.selectedBooking.value ==
                            AppStrings.completed,
                        isBookingScreen: true,
                      ),
                    ),
                    10.horizontal(),
                    Expanded(
                      child: CategoryWidget(
                        onTap: () => controller.selectedBooking.value =
                            AppStrings.cancelled,
                        cat: AppStrings.cancelled,
                        isSelected: controller.selectedBooking.value ==
                            AppStrings.cancelled,
                        isBookingScreen: true,
                      ),
                    ),
                  ],
                ),
              );
            }),
            10.vertical(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: p16),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.grey20,
                          blurRadius: 2,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: p16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const S12Text(
                                "10, May 2023",
                                fontWeight: FontWeight.w600,
                              ),
                              if (controller.selectedBooking.value !=
                                  AppStrings.upcoming)
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: controller.selectedBooking.value ==
                                            AppStrings.cancelled
                                        ? AppColor.orange
                                        : AppColor.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SText(
                                      controller.selectedBooking.value,
                                      size: 10,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }),
                        const Divider(height: 20),
                        const S16Text(
                          "Vendor name",
                          fontWeight: FontWeight.w700,
                        ),
                        const S14Text(
                          "Vendor address here",
                          color: AppColor.grey60,
                        ),
                        5.vertical(),
                        const S14Text(
                          "Hair cut + Shave",
                          color: AppColor.grey80,
                        ),
                        const S14Text(
                          "250",
                          color: AppColor.grey100,
                          fontWeight: FontWeight.w600,
                        ),
                        Obx(
                          () => (controller.selectedBooking.value !=
                                      AppStrings.cancelled
                                  ? 15
                                  : 0)
                              .vertical(),
                        ),
                        Obx(() {
                          return controller.selectedBooking.value !=
                                  AppStrings.cancelled
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: controller.selectedBooking.value ==
                                              AppStrings.completed
                                          ? const SizedBox()
                                          : CommonBtn(
                                              isBoxShadow: false,
                                              text: AppStrings.cancelBook,
                                              btnColor: const Color.fromARGB(
                                                0,
                                                153,
                                                131,
                                                131,
                                              ),
                                              textColor: AppColor.redColor,
                                              borderColor: Colors.transparent,
                                              vertPad: 8,
                                              borderRad: 8,
                                              textSize: 14,
                                              onTap: () => Get.bottomSheet(
                                                CommonDialog(
                                                  title: AppStrings.cancelBook,
                                                  desc:
                                                      AppStrings.areUSUreCancel,
                                                  yesBtnString:
                                                      AppStrings.yesCancel,
                                                  onYesTap: () => Get.back(),
                                                ),
                                              ),
                                            ),
                                    ),
                                    10.horizontal(),
                                    Expanded(
                                      child: CommonBtn(
                                        isBoxShadow: false,
                                        text:
                                            controller.selectedBooking.value ==
                                                    AppStrings.completed
                                                ? AppStrings.reorder
                                                : AppStrings.getDirection,
                                        btnColor: const Color.fromARGB(
                                          0,
                                          153,
                                          131,
                                          131,
                                        ),
                                        textColor: AppColor.primaryColor,
                                        vertPad: 8,
                                        borderRad: 8,
                                        textSize: 14,
                                        onTap: () {
                                          if (controller
                                                  .selectedBooking.value !=
                                              AppStrings.completed) {
                                            MapsLauncher.launchCoordinates(
                                              22.75481,
                                              73.511554,
                                              'Salon is here',
                                            );
                                          } else {
                                            VendorNBookingController
                                                controller = Get.put(
                                              VendorNBookingController(
                                                isBookingScreen: true,
                                              ),
                                            );
                                            controller.selectedSpecialist = 0;
                                            controller
                                              ..selectedService.clear()
                                              ..selectedService.add(0)
                                              ..update();
                                            Get.toNamed(AppRoutes.bookService);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox();
                        })
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
