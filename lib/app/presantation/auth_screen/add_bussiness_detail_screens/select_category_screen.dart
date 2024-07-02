import 'package:salon_user/app/utils/all_dependancy.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Column(
          children: [
            const SText(
              AppStrings.whatServiceDoU,
              size: 26,
              fontWeight: FontWeight.w700,
            ),
            8.vertical(),
            const S14Text(
              AppStrings.chooseService,
              color: AppColor.grey80,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: controller.categoryList.length,
              padding: const EdgeInsets.symmetric(vertical: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                (String, String) catData = controller.categoryList[index];
                bool isSelected = controller.selectedCat.contains(catData.$2);
                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      controller.selectedCat.remove(catData.$2);
                    } else {
                      controller.selectedCat.add(catData.$2);
                    }
                    controller.update();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? AppColor.grey100 : AppColor.grey40,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            catData.$1,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          10.vertical(),
                          S18Text(
                            catData.$2,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
