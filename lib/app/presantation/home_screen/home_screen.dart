import 'package:salon_user/app/utils/all_dependancy.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(p16),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    S24Text("Hello, User"),
                    S14Text(AppStrings.findTheService),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.profileScreen),
                child: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  child: SvgPicture.asset(
                    AppAssets.personIc,
                    // ignore: deprecated_member_use
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
          20.vertical(),
          CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              aspectRatio: 2.2,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 0.95,
              disableCenter: false,
              padEnds: false,
            ),
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primaryLightColor,
                  ),
                  child: const SizedBox(
                    height: 150,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
          20.vertical(),
          ViewAllBtn(
            onTap: () {
              controller.selectedCat = "";
              Get.toNamed(AppRoutes.producListingScreen);
            },
            text: AppStrings.featuredSaloon,
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.vendorScreen),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  AppAssets.dummySalon,
                                  height: 170,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: AppColor.white,
                                  radius: 15,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: AppColor.redColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          10.vertical(),
                          const S12Text(
                            "Hair, Nails, Facial",
                            color: AppColor.primaryColor,
                          ),
                          const S16Text(
                            "Salon",
                            maxLines: 1,
                            color: AppColor.grey100,
                            fontWeight: FontWeight.w700,
                          ),
                          5.vertical(),
                          const S12Text(
                            "320 Surat Rd, Varachha, Gujarat",
                            maxLines: 2,
                          ),
                          10.vertical(),
                          const Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: AppColor.orange,
                                size: 15,
                              ),
                              S12Text(
                                "  4.8",
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              S12Text(
                                " (10)",
                                color: AppColor.primaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const S16Text(
            AppStrings.whatDoU,
            fontWeight: FontWeight.w700,
            color: AppColor.grey100,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.categoryList.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              (String, String) catData = controller.categoryList[index];
              return GestureDetector(
                onTap: () {
                  controller.selectedCat = catData.$2;
                  Get.toNamed(AppRoutes.producListingScreen);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.grey20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.width / 4,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              catData.$1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: S14Text(
                            catData.$2,
                            fontWeight: FontWeight.w700,
                            color: AppColor.grey100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
