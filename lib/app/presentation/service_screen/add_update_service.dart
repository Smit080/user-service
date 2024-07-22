import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:salon_user/app/utils/all_dependency.dart';
import 'time_picker_dialog.dart';

class AddUpdateServiceScreen extends StatelessWidget {
  const AddUpdateServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController controller = Get.find<ServiceController>();
    return CommonAppbar(
      title: "Service Name",
      padd: const EdgeInsets.all(p16),
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(p16),
            child: CommonBtn(
              text: AppStrings.add,
              onTap: () => Get.back(),
            ),
          ),
        ],
      ),
      children: [
        CommonTextfield(
          controller: controller.serviceName,
          title: AppStrings.serviceName,
          fontWeight: FontWeight.w600,
          textColor: AppColor.grey100,
        ),
        Row(
          children: [
            Expanded(
              child: CommonTextfield(
                controller: controller.servicePrice,
                title: AppStrings.price,
                fontWeight: FontWeight.w600,
                textColor: AppColor.grey100,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            15.horizontal(),
            Expanded(
              child: GetBuilder<ServiceController>(
                builder: (controller) {
                  return CommonTextfield(
                    controller:
                        TextEditingController(text: controller.timeToString()),
                    title: AppStrings.serviceTime,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.grey100,
                    readOnly: true,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomTimePickerDialog(
                            time: controller.serviceTime,
                            onTap: (int time) {
                              controller.serviceTime = time;
                              controller.update();
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        CommonTextfield(
          controller: controller.serviceDesc,
          title: AppStrings.aboutService,
          fontWeight: FontWeight.w600,
          textColor: AppColor.grey100,
        ),
        const S16Text(
          AppStrings.businessImg,
          fontWeight: FontWeight.w600,
          color: AppColor.grey100,
        ),
        GetBuilder<ServiceController>(
          builder: (controller) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: controller.businessImgList.length + 1,
              padding: const EdgeInsets.only(top: 8, bottom: 40),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return index == controller.businessImgList.length
                    ? Padding(
                        padding: const EdgeInsets.all(2),
                        child: GestureDetector(
                          onTap: () async {
                            controller.businessImgList
                                .addAll(await selectFiles());
                            controller.update();
                          },
                          child: DottedBorder(
                            color: AppColor.primaryColor,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [7, 2],
                            strokeWidth: 2,
                            child: const Center(
                              child: Icon(Icons.add, size: 20),
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(controller.businessImgList[index]),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller
                                ..businessImgList.removeAt(index)
                                ..update();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColor.redColor,
                                child: Icon(
                                  Icons.delete,
                                  color: AppColor.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
              },
            );
          },
        ),
      ],
    );
  }
}
