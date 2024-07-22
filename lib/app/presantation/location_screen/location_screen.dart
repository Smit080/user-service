import '../../utils/all_dependancy.dart';

class LocationScreen extends GetView<LocationController> {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetBuilder<LocationController>(
      builder: (controller) {
        return ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.bottom / 2) -
                      40,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: controller.kGooglePlex,
                    mapToolbarEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.bottom / 2) -
                      40,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          p16,
                          AppBar().preferredSize.height,
                          p16,
                          0,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: boxShadow(),
                          ),
                          child: TextField(
                            controller: controller.searchController,
                            focusNode: controller.focusNode,
                            onTap: () => controller.update(),
                            onTapOutside: (event) {
                              controller
                                ..focusNode.unfocus()
                                ..update();
                            },
                            onChanged: (value) =>
                                controller.search.value = value,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.grey100,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search bussineses here...",
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: SvgPicture.asset(
                                  AppAssets.location,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              suffixIcon: controller.focusNode.hasFocus ||
                                      controller
                                          .searchController.text.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.search.value = "";
                                        controller
                                          ..focusNode.unfocus()
                                          ..searchController.clear()
                                          ..update();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child:
                                            SvgPicture.asset(AppAssets.close),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.search.value.isEmpty) {
                          return SizedBox(
                            height: 64,
                            child: ListView.builder(
                              itemCount: controller.catList.length,
                              padding: const EdgeInsets.all(p16),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                String cat = controller.catList[index];
                                bool isSelected =
                                    controller.selectedCat.contains(index);
                                return CategoryWidget(
                                  onTap: () {
                                    if (isSelected) {
                                      controller.selectedCat.remove(index);
                                    } else {
                                      controller.selectedCat.add(index);
                                    }
                                    controller.update();
                                  },
                                  cat: cat,
                                  isSelected: isSelected,
                                );
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: p16,
                              vertical: 10,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white,
                                boxShadow: boxShadow(),
                              ),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: double.infinity,
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(p16),
                                      child: S16Text(
                                        "Vanue or Service",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: p16,
                                      ),
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return SearchWidget(index: index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(
                                AppRoutes.producListingScreen,
                              ),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  boxShadow: boxShadow(),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(AppAssets.menu),
                                ),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                boxShadow: boxShadow(),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  AppAssets.currentLocation,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.vendorScreen),
                          child: SizedBox(
                            height: 131,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: boxShadow(),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: Image.asset(
                                      AppAssets.dummySalon,
                                      width: 131,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const S12Text(
                                            "Hair, Facial",
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF156778),
                                          ),
                                          4.vertical(),
                                          const S16Text(
                                            "Sophisticated Salon",
                                            color: AppColor.grey100,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          5.vertical(),
                                          const S12Text(
                                            "2807  Sherwood Circle, Kern..",
                                            color: AppColor.grey80,
                                            maxLines: 2,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppAssets.star),
                                              const SizedBox(width: 8),
                                              const S12Text(
                                                "4.7",
                                                color: AppColor.grey100,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              const SizedBox(width: 4),
                                              const S12Text(
                                                "(2.7k)",
                                                color: AppColor.grey100,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.vertical(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<BoxShadow> boxShadow() => [
        const BoxShadow(
          color: Colors.black12,
          offset: Offset(2, 2),
          blurRadius: 5,
          spreadRadius: 2,
        )
      ];
}
// GoogleMap(
// mapType: MapType.hybrid,
// initialCameraPosition: controller.kGooglePlex,
// onMapCreated: (GoogleMapController controller) {
// // _controller.complete(controller);
// },
// ),
