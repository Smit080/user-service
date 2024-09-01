import 'package:dotted_line/dotted_line.dart';
import 'package:salon_user/app/utils/all_dependency.dart';

class CheckoutScreen extends GetView<VendorNBookingController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: AppStrings.bookingCheckout,
      children: [
        Padding(
          padding: const EdgeInsets.all(p16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.primaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        widget(
                          AppStrings.date,
                          DateFormat("MMMM, dd yyyy")
                              .format(controller.selectedDate!),
                          5,
                        ),
                        widget(
                          AppStrings.startTime,
                          controller.selectedTime,
                          3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Row(
                      children: [
                        widget(
                          AppStrings.date,
                          DateFormat("MMMM, dd yyyy")
                              .format(controller.selectedDate!),
                          5,
                        ),
                        widget(
                          AppStrings.startTime,
                          controller.selectedTime,
                          3,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Divider(height: 0),
                  ),
                  const S14Text(
                    AppStrings.services,
                    fontWeight: FontWeight.w600,
                  ),
                  ...List.generate(
                    controller.selectedService.length,
                    (index) => rowText("Service name", "100"),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: DottedLine(
                      dashColor: AppColor.grey40,
                    ),
                  ),
                  rowText(AppStrings.subTotal, "100"),
                  rowText(AppStrings.discount, "0", minus: "-"),
                  15.vertical(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(AppAssets.halfCircle),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: DottedLine(
                            dashColor: AppColor.grey60,
                          ),
                        ),
                      ),
                      SvgPicture.asset(AppAssets.halfCircle),
                    ],
                  ),
                  rowText(AppStrings.total, "100"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CommonBtn(text: AppStrings.payNow, onTap: () {}),
        ),
      ],
    );
  }

  Widget widget(String title, String text, int flex) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          S14Text(title),
          5.vertical(),
          S14Text(
            text,
            maxLines: 1,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget rowText(String title, String money, {String? minus = ""}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          S14Text(
            title,
            color: AppColor.grey100,
            fontWeight: FontWeight.w700,
          ),
          S14Text(
            "$minus₹$money",
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
