import 'package:salon_user/app/utils/all_dependency.dart';

void serviceDetailSheet(int index) {
  Get.bottomSheet(
    ServiceDetailSheet(index: index),
    isScrollControlled: true,
  );
}

class ServiceDetailSheet extends StatelessWidget {
  final int index;
  const ServiceDetailSheet({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    VendorNBookingController controller = Get.find<VendorNBookingController>();
    return PopScope(
      onPopInvoked: (didPop) => controller.currentServiceImg = 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: ColoredBox(
            color: AppColor.white,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider.builder(
                        itemCount: 6,
                        options: CarouselOptions(
                          viewportFraction: 1,
                          aspectRatio: 1.3,
                          onPageChanged: (index, reason) {
                            controller.currentServiceImg = index;
                            controller.update();
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Image.asset(
                            index % 2 == 0
                                ? AppAssets.dummySalon2
                                : AppAssets.dummySalon,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      GetBuilder<VendorNBookingController>(
                        builder: (controller) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              6,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 10,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: controller.currentServiceImg == index
                                        ? AppColor.orange
                                        : AppColor.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal:
                                          controller.currentServiceImg == index
                                              ? 12
                                              : 4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SText(
                          "Service Name",
                          size: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        5.vertical(),
                        const Row(
                          children: [
                            S16Text(
                              "\$50",
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: AppColor.grey40,
                              ),
                            ),
                            S14Text(
                              "30 min",
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Divider(height: 35),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: S16Text(
                            AppStrings.aboutService,
                            fontWeight: FontWeight.w700,
                            color: AppColor.grey100,
                          ),
                        ),
                        ReadMoreText(
                          AppStrings.loremText * 5,
                          isExpandable: true,
                          trimLength: 200,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColor.grey80,
                            fontWeight: FontWeight.w500,
                          ),
                          moreStyle: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          lessStyle: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        20.vertical(),
                        GetBuilder<VendorNBookingController>(
                          builder: (controller) {
                            bool isContain =
                                controller.selectedService.contains(index);
                            return CommonBtn(
                              text: isContain
                                  ? AppStrings.removeFromBooking
                                  : AppStrings.addToBooking,
                              onTap: () {
                                if (isContain) {
                                  controller.selectedService.remove(index);
                                } else {
                                  controller.selectedService.add(index);
                                }
                                controller.update();
                                Get.back();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
