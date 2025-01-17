import 'package:salon_user/app/utils/all_dependancy.dart';

class ForgotPassScreen extends GetWidget<AuthController> {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AuthCommonScreen(
      title: AppStrings.fPass,
      desc: AppStrings.pleaseTypeEmailOtp,
      isBack: true,
      onTap: () => controller.clearTap(isBack: true),
      bottomNavBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              p16,
              10,
              p16,
              MediaQuery.of(context).viewInsets.bottom + p16,
            ),
            child: CommonBtn(
              text: AppStrings.sendCode,
              onTap: () {
                controller.startTimer();
                return Get.toNamed(AppRoutes.otpScreen);
              },
            ),
          ),
        ],
      ),
      children: [
        (size.height * 0.1).vertical(),
        CommonTextfield(
          controller: controller.email,
          prefixIcon: AppAssets.emailIc,
          hintText: AppStrings.emailAddress,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
