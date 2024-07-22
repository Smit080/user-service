import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:salon_user/app/utils/all_dependency.dart';

class AddDetailScreen extends StatelessWidget {
  const AddDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find<AuthController>();
    return controller.isSettingScreen
        ? Scaffold(
            backgroundColor: AppColor.white,
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(p16),
                  child: CommonBtn(
                    text: "Save",
                    borderRad: 10,
                    onTap: () => Get.back(),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: p16, top: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back_rounded),
                        ),
                        15.horizontal(),
                        const S24Text(AppStrings.businessDetail),
                      ],
                    ),
                    15.vertical(),
                    widget(),
                  ],
                ),
              ),
            ),
          )
        : widget();
  }

  Expanded widget() {
    AuthController controller = Get.find<AuthController>();
    return Expanded(
      child: ListView(
        primary: false,
        children: [
          if (controller.isSettingScreen)
            GetBuilder<AuthController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () async {
                    controller.logoImg = await selectFile();
                    controller.update();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.grey20,
                    child: controller.logoImg.isNotEmpty
                        ? ClipOval(
                            child: Image.file(
                              File(controller.logoImg),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(
                            Icons.add_rounded,
                            color: AppColor.grey80,
                            size: 35,
                          ),
                  ),
                );
              },
            ),
          if (controller.isSettingScreen)
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 25),
              child: S18Text(
                "Set business log",
                color: AppColor.grey80,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
          if (!controller.isSettingScreen)
            const SText(
              AppStrings.businessDetail,
              size: 26,
              fontWeight: FontWeight.w700,
            ),
          if (!controller.isSettingScreen) 8.vertical(),
          if (!controller.isSettingScreen)
            const S14Text(
              AppStrings.tellUsMoreBusiness,
              color: AppColor.grey80,
            ),
          if (!controller.isSettingScreen) 20.vertical(),
          CommonTextfield(
            controller: controller.businessName,
            title: AppStrings.businessName,
            fontWeight: FontWeight.w600,
            textColor: AppColor.grey100,
          ),
          CommonTextfield(
            controller: controller.businessDesc,
            title: AppStrings.businessDesc,
            fontWeight: FontWeight.w600,
            textColor: AppColor.grey100,
          ),
          CommonTextfield(
            controller: controller.businessAddress,
            title: AppStrings.businessLoc,
            fontWeight: FontWeight.w600,
            textColor: AppColor.grey100,
          ),
          const S16Text(
            AppStrings.whatTeam,
            fontWeight: FontWeight.w600,
            color: AppColor.grey100,
          ),
          8.vertical(),
          GetBuilder<AuthController>(
            builder: (controller) {
              return DropdownButtonFormField2(
                decoration: InputDecoration(
                  focusedBorder: outlineInputBorder(color: AppColor.primaryColor),
                  fillColor: AppColor.grey20,
                  filled: true,
                  suffix: const SizedBox(width: 15),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  enabledBorder: outlineInputBorder(),
                ),
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: [
                  AppStrings.itsMe,
                  "2-5 people",
                  "6-10 people",
                  "11+ people",
                ]
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.grey100,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) async {
                  if (value != null) {
                    controller.teamSize = value;
                    controller.update();
                  }
                },
              );
            },
          ),
          15.vertical(),
          const S16Text(
            AppStrings.businessImg,
            fontWeight: FontWeight.w600,
            color: AppColor.grey100,
          ),
          8.vertical(),
          GetBuilder<AuthController>(
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
                              controller.businessImgList = await selectFiles();
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
                              child: Image.asset(
                                controller.businessImgList[index],
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
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color ?? AppColor.grey20,
        ),
      );
}
