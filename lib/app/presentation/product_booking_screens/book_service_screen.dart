import 'package:salon_user/app/utils/all_dependency.dart';

class BookServiceScreen extends GetView<VendorNBookingController> {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      onBackTap: () => controller.selectedSpecialist = -1,
      title: AppStrings.bookService,
      bottomWidget: const BottomBookNowWidget(isServiceList: null),
      padding: const EdgeInsets.all(p16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const S16Text(
              AppStrings.yrServiceOrder,
              fontWeight: FontWeight.w700,
              color: AppColor.grey100,
            ),
            if (!controller.isBookingScreen)
              GestureDetector(
                onTap: () => Get.back(),
                child: const S14Text(
                  AppStrings.addMore,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        GetBuilder<VendorNBookingController>(
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: controller.selectedService.length,
              itemBuilder: (context, index) {
                return BookingServiceContainer(index: index);
              },
            );
          },
        ),
        const S16Text(
          AppStrings.specialist,
          fontWeight: FontWeight.w700,
          color: AppColor.grey100,
        ),
        GetBuilder<VendorNBookingController>(
          builder: (controller) {
            return SpecialistWidget(
              selectIndex: controller.selectedSpecialist,
              onTap: (index) {
                controller.selectedSpecialist = index;
                controller.update();
              },
            );
          },
        ),
        15.vertical(),
        const S16Text(
          AppStrings.chooseDate,
          fontWeight: FontWeight.w700,
          color: AppColor.grey100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 22),
          child: SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.dateList.length,
              itemBuilder: (context, index) {
                DateTime date = controller.dateList[index];
                return GetBuilder<VendorNBookingController>(
                  builder: (controller) {
                    bool isSelected = controller.selectedDate != null
                        ? controller.selectedDate == date
                        : false;
                    return GestureDetector(
                      onTap: () {
                        controller.selectedDate = date;
                        controller.update();
                      },
                      child: Container(
                        width: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isSelected
                              ? AppColor.primaryColor
                              : AppColor.primaryLightColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            S12Text(
                              DateFormat("EEE").format(date),
                              color: isSelected
                                  ? AppColor.grey40
                                  : AppColor.grey80,
                            ),
                            SText(
                              date.day.toString(),
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? AppColor.white
                                  : AppColor.grey100,
                            ),
                            S12Text(
                              DateFormat("MMM").format(date),
                              color: isSelected
                                  ? AppColor.grey40
                                  : AppColor.grey80,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        const S16Text(
          AppStrings.chooseTime,
          fontWeight: FontWeight.w700,
          color: AppColor.grey100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.timeList.length,
              itemBuilder: (context, index) {
                String time = controller.timeList[index];
                return GetBuilder<VendorNBookingController>(
                  builder: (controller) {
                    bool isSelected = controller.selectedTime == time;
                    return GestureDetector(
                      onTap: () {
                        controller.selectedTime = time;
                        controller.update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isSelected
                              ? AppColor.primaryLightColor
                              : AppColor.white,
                          border: Border.all(
                            color: isSelected
                                ? AppColor.primaryColor
                                : AppColor.grey60,
                          ),
                        ),
                        child: S14Text(
                          time,
                          color: isSelected
                              ? AppColor.primaryColor
                              : AppColor.grey100,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
