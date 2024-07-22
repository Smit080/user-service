import 'package:salon_user/app/utils/all_dependency.dart';

class StaffListScreen extends StatelessWidget {
  const StaffListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      floatingAction: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.addStaffMember);
        },
        child: const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.add_rounded,
              color: AppColor.white,
            ),
          ),
        ),
      ),
      title: AppStrings.staffMember,
      padd: const EdgeInsets.all(p16),
      scrollPhysics: const NeverScrollableScrollPhysics(),
      children: [
        CommonSearchFiled(
          hintText: "Search staff member",
          onSearch: (_) {},
        ),
        10.vertical(),
        ConstrainedBox(
          constraints: BoxConstraints.loose(MediaQuery.of(context).size),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addStaffMember);
                    },
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.dummyPerson1),
                            backgroundColor: AppColor.grey20,
                          ),
                          15.horizontal(),
                          const S16Text(
                            "Employee name",
                            color: AppColor.grey100,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.primaryColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 30, color: AppColor.grey40),
                  if (index == 9) (MediaQuery.of(context).size.height * 0.2).vertical(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
