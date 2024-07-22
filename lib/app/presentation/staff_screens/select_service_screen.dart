import 'package:flutter/cupertino.dart';

import '../../utils/all_dependency.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: S14Text(
            "Choose the services this team member provides",
            fontWeight: FontWeight.w500,
            color: AppColor.grey80,
          ),
        ),
        GetBuilder<StaffController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == 0 ? 5 : 10),
                  child: Row(
                    children: [
                      Checkbox(
                        value: index == 0
                            ? controller.selectedService.length == 9
                            : controller.selectedService.contains(index),
                        onChanged: (value) {
                          if (index == 0) {
                            if (controller.selectedService.length < 9) {
                              controller.selectedService = List.generate(9, (ind) => ind + 1);
                            } else {
                              controller.selectedService.clear();
                            }
                          } else {
                            if (controller.selectedService.contains(index)) {
                              controller.selectedService.remove(index);
                            } else {
                              controller.selectedService.add(index);
                            }
                          }
                          controller.update();
                        },
                      ),
                      Expanded(
                        child: index == 0
                            ? const S14Text("Select all")
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const S16Text(
                                    "Service Name",
                                    color: AppColor.grey100,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  3.vertical(),
                                  const S12Text(
                                    "30 min",
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.grey80,
                                  ),
                                ],
                              ),
                      ),
                      if (index != 0)
                        const S14Text(
                          "${AppStrings.rupee} 50",
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey80,
                        )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
