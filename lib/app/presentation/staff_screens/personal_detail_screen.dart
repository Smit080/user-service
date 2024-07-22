import 'dart:io';
import 'package:salon_user/app/utils/all_dependency.dart';

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StaffController controller = Get.find<StaffController>();
    return Column(
      children: [
        20.vertical(),
        GetBuilder<StaffController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () async {
                controller.image = await selectFile();
                controller.update();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.grey20,
                child: controller.image.isNotEmpty
                    ? ClipOval(
                        child: Image.file(
                          File(controller.image),
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
        15.vertical(),
        CommonTextfield(
          controller: controller.fName,
          title: "First name",
        ),
        CommonTextfield(
          controller: controller.lName,
          title: "Last name",
        ),
        CommonTextfield(
          controller: controller.email,
          title: "Email address",
        ),
        CommonTextfield(
          controller: controller.phone,
          title: "Mobile number",
        ),
        CommonTextfield(
          controller: controller.addPhone,
          title: "Additional mobile number",
        ),
        CommonTextfield(
          controller: controller.address,
          title: "Address",
        ),
        GetBuilder<StaffController>(
          builder: (controller) {
            return CommonTextfield(
              controller: TextEditingController(
                text: controller.dob == null
                    ? ""
                    : DateFormat("dd MMMM, yyyy").format(controller.dob!),
              ),
              readOnly: true,
              onTap: () {
                Get.dialog(
                  CustomDatePicker(
                    onDateSelect: (p0) {
                      controller.dob = p0;
                      controller.update();
                    },
                    startDate: DateTime(1950),
                    focuseDay: controller.dob,
                    endDate: DateTime.now(),
                  ),
                );
              },
              title: "Date of birth",
            );
          },
        ),
      ],
    );
  }
}
