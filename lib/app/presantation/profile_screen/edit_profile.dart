import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:salon_user/app/utils/all_dependancy.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find<ProfileController>();
    return CommonAppbar(
      title: AppStrings.editProfile,
      padd: const EdgeInsets.all(p16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColor.primaryLightColor,
                  child: ClipOval(
                    child: Image.network(
                      controller.imgUrl ?? "",
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.file(
                        File(controller.imgFile ?? ""),
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value != null) {
                        controller.imgFile = value.path;
                        controller.update();
                      }
                    });
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColor.primaryColor,
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        25.vertical(),
        CommonTextfield(
          controller: controller.name,
          hintText: AppStrings.enterName,
          prefixIcon: AppAssets.personIc,
          isProfileScreen: true,
          title: AppStrings.name,
        ),
        CommonTextfield(
          controller: controller.email,
          hintText: AppStrings.enterEmailAddress,
          title: AppStrings.emailAddress,
          prefixIcon: AppAssets.emailIc,
          keyboardType: TextInputType.emailAddress,
          isProfileScreen: true,
        ),
        CommonTextfield(
          controller: controller.mobile,
          hintText: AppStrings.enterMobileNumber,
          title: AppStrings.mobileNumber,
          prefixIcon: AppAssets.phoneIc,
          keyboardType: TextInputType.phone,
          isProfileScreen: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        GetBuilder<ProfileController>(
          builder: (controller) {
            "== ${controller.dob}".print();
            return CommonTextfield(
              controller: TextEditingController(
                text: controller.dob == null
                    ? ""
                    : DateFormat("dd MMMM, yyyy").format(controller.dob!),
              ),
              hintText: AppStrings.enterDob,
              title: AppStrings.dob,
              prefixIcon: AppAssets.calender,
              readOnly: true,
              isProfileScreen: true,
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  currentDate: controller.dob,
                ).then((value) {
                  controller.dob = value;
                  controller.update();
                });
              },
            );
          },
        ),
        const S16Text(
          AppStrings.gender,
          fontWeight: FontWeight.w700,
          color: AppColor.grey100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            genderWidget(value: AppStrings.male),
            genderWidget(value: AppStrings.female),
            genderWidget(value: AppStrings.other),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 30),
          child: CommonBtn(
            text: AppStrings.update,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget genderWidget({required String value}) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        bool isSelected = controller.gender == value;
        return GestureDetector(
          onTap: () {
            controller.gender = value;
            controller.update();
          },
          child: ColoredBox(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor:
                        isSelected ? AppColor.primaryColor : AppColor.grey40,
                  ),
                  8.horizontal(),
                  S14Text(
                    value,
                    fontWeight: FontWeight.w600,
                    color: AppColor.grey100,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
