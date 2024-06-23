import 'package:salon_user/app/utils/all_dependancy.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: AppStrings.favourite,
      padd: EdgeInsets.zero,
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          padding: const EdgeInsets.all(p16),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.59,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.vendorScreen),
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
                          fit: BoxFit.cover,
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
            );
          },
        ),
      ],
    );
  }
}
