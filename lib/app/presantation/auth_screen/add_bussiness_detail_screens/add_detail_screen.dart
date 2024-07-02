import 'package:salon_user/app/utils/all_dependancy.dart';

class AddDetailScreen extends StatelessWidget {
  const AddDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SText(
          AppStrings.businessDetail,
          size: 26,
          fontWeight: FontWeight.w700,
        ),
        8.vertical(),
        const S14Text(
          AppStrings.tellUsMoreBusiness,
          color: AppColor.grey80,
        ),
        CommonTextfield(
          controller: TextEditingController(),
          prefixIcon: AppAssets.aboutus,
          hintText: "hintText",
        ),
      ],
    );
  }
}
