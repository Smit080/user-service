import 'package:salon_user/app/common_widgets/common_dialog.dart';
import 'package:salon_user/app/utils/all_dependancy.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return CommonAppbar(
      title: AppStrings.profile,
      padd: const EdgeInsets.all(p16),
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.grey40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(p16),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColor.primaryLightColor,
                  radius: 32,
                ),
                15.horizontal(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const S18Text(
                        "User Name",
                        color: AppColor.primaryColor,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.editProfileScreen),
                        child: const S12Text(
                          AppStrings.editProfile,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        10.vertical(),
        profileWidget(
          icon: AppAssets.favourite,
          text: AppStrings.favourite,
          onTap: () => Get.toNamed(AppRoutes.favouriteScreen),
        ),
        profileWidget(
          icon: AppAssets.coupon,
          text: AppStrings.voucher,
          onTap: () {},
        ),
        profileWidget(
          icon: AppAssets.gift,
          text: AppStrings.giftCard,
          onTap: () {},
        ),
        profileWidget(
          icon: AppAssets.aboutus,
          text: AppStrings.aboutUs,
          onTap: () {
            controller.docScreen = AppStrings.aboutUs;
            Get.toNamed(AppRoutes.commonDocScreen);
          },
        ),
        profileWidget(
          icon: AppAssets.privacy,
          text: AppStrings.privacy,
          onTap: () {
            controller.docScreen = AppStrings.privacy;
            Get.toNamed(AppRoutes.commonDocScreen);
          },
        ),
        profileWidget(
          icon: AppAssets.terms,
          text: AppStrings.terms,
          onTap: () {
            controller.docScreen = AppStrings.terms;
            Get.toNamed(AppRoutes.commonDocScreen);
          },
        ),
        profileWidget(
          icon: AppAssets.logout,
          text: AppStrings.logout,
          issuffixIc: false,
          onTap: () => Get.bottomSheet(
            CommonDialog(
              title: AppStrings.logout,
              desc: AppStrings.areUSureLogout,
              yesbtnString: AppStrings.yesLogout,
              onYesTap: () => Get.offAllNamed(AppRoutes.loginScreen),
            ),
          ),
        ),
        profileWidget(
          icon: AppAssets.delete,
          text: AppStrings.deleteAcc,
          isLast: true,
          issuffixIc: false,
          color: AppColor.redColor,
          onTap: () => Get.bottomSheet(
            CommonDialog(
              title: AppStrings.deleteAcc,
              desc: AppStrings.areUSureDelete,
              yesbtnString: AppStrings.yesDelete,
              onYesTap: () => Get.offAllNamed(AppRoutes.loginScreen),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileWidget({
    required String icon,
    required String text,
    required Function onTap,
    bool isLast = false,
    bool issuffixIc = true,
    Color? color,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onTap(),
          child: ColoredBox(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                    color: AppColor.grey100,
                  ),
                  12.horizontal(),
                  S16Text(
                    text,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                  const Spacer(),
                  if (issuffixIc)
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: AppColor.grey100,
                    )
                ],
              ),
            ),
          ),
        ),
        if (!isLast) const Divider(height: 0),
      ],
    );
  }
}
