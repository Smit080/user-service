import 'package:salon_user/app/utils/all_dependancy.dart';

class OurServiceWidget extends StatelessWidget {
  final bool isTitle;
  final EdgeInsets? padd;
  const OurServiceWidget({super.key, this.isTitle = true, this.padd});

  @override
  Widget build(BuildContext context) {
    VendorNBookingController controller = Get.find<VendorNBookingController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTitle)
          const S16Text(
            AppStrings.ourService,
            fontWeight: FontWeight.w700,
            color: AppColor.grey100,
          ),
        SizedBox(
          height: 65,
          child: ListView.builder(
            shrinkWrap: true,
            padding: padd ?? const EdgeInsets.only(top: 15, bottom: 8),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              (String, String) catData = controller.categoryList[index];
              return GetBuilder<VendorNBookingController>(
                builder: (controller) {
                  bool isContaint =
                      controller.selectedServiceCat.contains(index);
                  return GestureDetector(
                    onTap: () {
                      if (isContaint) {
                        controller.selectedServiceCat.remove(index);
                      } else {
                        controller.selectedServiceCat.add(index);
                      }
                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isContaint
                                ? AppColor.primaryColor
                                : AppColor.grey60,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: isContaint
                              ? AppColor.primaryLightColor
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                catData.$1,
                                width: 20,
                              ),
                              8.horizontal(),
                              S14Text(
                                catData.$2,
                                fontWeight: FontWeight.w600,
                                color: isContaint
                                    ? AppColor.primaryColor
                                    : AppColor.grey100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
