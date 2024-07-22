import 'package:salon_user/app/utils/all_dependancy.dart';

class ServiceContainer extends StatelessWidget {
  final int index;
  const ServiceContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () => serviceDetailsheet(index),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD9D9D9).withOpacity(0.25),
                blurRadius: 8,
                spreadRadius: 5,
              )
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  AppAssets.dummySalon2,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const S14Text(
                        "Service name",
                        color: AppColor.grey100,
                        fontWeight: FontWeight.w700,
                      ),
                      3.vertical(),
                      const Row(
                        children: [
                          S14Text(
                            "₹50",
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
                          S12Text(
                            "30 min",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      5.vertical(),
                      Row(
                        children: [
                          const Expanded(
                            child: S12Text(
                              AppStrings.loremText,
                              maxLines: 2,
                            ),
                          ),
                          5.horizontal(),
                          GetBuilder<VendorNBookingController>(
                            builder: (controller) {
                              bool isContaint =
                                  controller.selectedService.contains(index);
                              return GestureDetector(
                                onTap: () {
                                  if (isContaint) {
                                    controller.selectedService.remove(index);
                                  } else {
                                    controller.selectedService.add(index);
                                  }
                                  controller.update();
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: isContaint
                                        ? Colors.transparent
                                        : AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isContaint
                                          ? AppColor.redColor
                                          : AppColor.primaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      isContaint ? Icons.remove : Icons.add,
                                      color: isContaint
                                          ? AppColor.redColor
                                          : AppColor.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingServiceContainer extends StatelessWidget {
  final int index;
  const BookingServiceContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () => serviceDetailsheet(index),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppAssets.dummySalon2,
                width: 65,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const S14Text(
                      "Service name",
                      color: AppColor.grey100,
                      fontWeight: FontWeight.w700,
                    ),
                    3.vertical(),
                    const Row(
                      children: [
                        S14Text(
                          "₹50",
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
                        S12Text(
                          "30 min",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<VendorNBookingController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedService.removeAt(index);
                    controller.update();
                    if (controller.selectedService.isEmpty) {
                      Get.back();
                    }
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.redColor,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.remove,
                        color: AppColor.redColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialistWidget extends StatelessWidget {
  final int selectIndex;
  final Function(int index)? onTap;
  const SpecialistWidget({super.key, this.selectIndex = -1, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 15, bottom: 5),
        itemBuilder: (context, index) {
          bool isSelect = selectIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(index);
                }
              },
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(AppAssets.dummyPerson1),
                      ),
                      border: Border.all(
                        color: isSelect
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: isSelect
                            ? AppColor.grey20.withOpacity(0.8)
                            : Colors.transparent,
                        radius: 30,
                        child: isSelect
                            ? const Icon(
                                Icons.check_rounded,
                                color: AppColor.primaryColor,
                              )
                            : null,
                      ),
                    ),
                  ),
                  8.vertical(),
                  const SizedBox(
                    width: 64,
                    child: S14Text(
                      "Name",
                      maxLines: 1,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey100,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
