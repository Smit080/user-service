import 'package:salon_user/app/common_widgets/commmon_product_widgets.dart';
import 'package:salon_user/app/utils/all_dependancy.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return CommonAppbar(
      title: controller.selectedCat,
      appbarSuffix: Padding(
        padding: const EdgeInsets.only(right: p16),
        child: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.searchScreen),
          child: SvgPicture.asset(AppAssets.search2Ic),
        ),
      ),
      children: [
        if (controller.selectedCat.isEmpty)
          GetBuilder<HomeController>(
            builder: (controller) {
              return SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: controller.catList.length,
                  padding: const EdgeInsets.fromLTRB(p16, p16, p16, 2),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String cat = controller.catList[index];
                    bool isSelected =
                        controller.selectedCatList.contains(index);
                    return CategoryWidget(
                      onTap: () {
                        if (isSelected) {
                          controller.selectedCatList.remove(index);
                        } else {
                          controller.selectedCatList.add(index);
                        }
                        controller.update();
                      },
                      cat: cat,
                      isSelected: isSelected,
                    );
                  },
                ),
              );
            },
          ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(p16),
          itemBuilder: (context, index) {
            return GetBuilder<HomeController>(
              builder: (controller) {
                return VendorDetailWidget(
                  currentPage: controller.currentServiceImg,
                  onPageChange: (indexes) {
                    controller.currentServiceImg = indexes;
                    controller.update();
                  },
                );
              },
            );
          },
        )
      ],
    );
  }
}
