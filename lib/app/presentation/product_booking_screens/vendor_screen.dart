import 'package:salon_user/app/utils/all_dependency.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  VendorNBookingController controller = Get.put(VendorNBookingController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.arguments != null) {
        if (Get.arguments) {
          Future.delayed(const Duration(milliseconds: 500), () {
            serviceDetailSheet(0);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBookNowWidget(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: 6,
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 1.3,
                  onPageChanged: (index, reason) {
                    controller.currentImg = index;
                    controller.update();
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    index % 2 == 0
                        ? AppAssets.dummySalon2
                        : AppAssets.dummySalon,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(p16),
                  child: Row(
                    children: [
                      CircularIcon(
                        icon: Icons.arrow_back_rounded,
                        onTap: () => Get.back(),
                      ),
                      const Spacer(),
                      CircularIcon(
                        icon: Icons.favorite_border_rounded,
                        color: AppColor.redColor,
                        onTap: () {},
                      ),
                      // 16.horizontal(),
                      // CircularIcon(
                      //   icon: Icons.map_rounded,
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.grey100,
                  ),
                  child: GetBuilder<VendorNBookingController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: S14Text(
                          "${controller.currentImg + 1} / 6",
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const S24Text("Plush Beauty Salon"),
                const S14Text("salon address is here"),
                2.vertical(),
                const S14Text(
                  "Open until 9:00 PM",
                  fontWeight: FontWeight.w600,
                ),
                8.vertical(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: AppColor.orange,
                      size: 25,
                    ),
                    5.horizontal(),
                    const S16Text(
                      "5.0",
                      color: AppColor.grey100,
                      fontWeight: FontWeight.w700,
                    ),
                    const S16Text(
                      " (100)",
                      color: AppColor.grey100,
                    ),
                  ],
                ),
                const Divider(height: 40),
                const OurServiceWidget(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ServiceContainer(index: index);
                  },
                ),
                CommonBtn(
                  vertPad: 10,
                  text: AppStrings.viewAllServices,
                  borderColor: AppColor.primaryColor,
                  btnColor: AppColor.white,
                  textColor: AppColor.primaryColor,
                  onTap: () => Get.toNamed(AppRoutes.serviceList),
                ),
                30.vertical(),
                ViewAllBtn(onTap: () {}, text: AppStrings.ourSpecialist),
                const SpecialistWidget(),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  child: S16Text(
                    AppStrings.about,
                    fontWeight: FontWeight.w700,
                    color: AppColor.grey100,
                  ),
                ),
                ReadMoreText(
                  AppStrings.loremText * 5,
                  isExpandable: true,
                  trimLength: 200,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.grey80,
                    fontWeight: FontWeight.w500,
                  ),
                  moreStyle: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  lessStyle: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 8),
                  child: S16Text(
                    AppStrings.openingTime,
                    fontWeight: FontWeight.w700,
                    color: AppColor.grey100,
                  ),
                ),
                ...List.generate(
                  7,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.green,
                        ),
                        8.horizontal(),
                        S14Text(
                          controller.dayList[index],
                          color: index == DateTime.now().weekday - 1
                              ? AppColor.grey100
                              : null,
                          fontWeight: index == DateTime.now().weekday - 1
                              ? FontWeight.w700
                              : null,
                        ),
                        const Spacer(),
                        S14Text(
                          "10:00 am - 6:00 pm",
                          color: index == DateTime.now().weekday - 1
                              ? AppColor.grey100
                              : null,
                          fontWeight: index == DateTime.now().weekday - 1
                              ? FontWeight.w700
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const SizedBox(
                      height: 200,
                      child: CompanyMap(
                        latLng: LatLng(22.75481, 73.511554),
                      ),
                    ),
                  ),
                ),
                const S14Text(
                  "salon address is here",
                  fontWeight: FontWeight.w600,
                ),
                3.vertical(),
                GestureDetector(
                  onTap: () {
                    MapsLauncher.launchCoordinates(
                      22.75481,
                      73.511554,
                      'Salon is here',
                    );
                  },
                  child: const S16Text(
                    AppStrings.getDirection,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryColor,
                  ),
                ),
                20.vertical(),
                ViewAllBtn(onTap: () {}, text: AppStrings.review),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (context, index) {
                    return const ReviewContainer();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
