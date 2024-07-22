import 'package:salon_user/app/utils/all_dependency.dart';

class ServiceListingScreen extends StatelessWidget {
  final bool isSettingScreen;
  const ServiceListingScreen({super.key, this.isSettingScreen = false});

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceController());
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(const AddUpdateServiceScreen()),
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          p16,
          MediaQuery.of(context).padding.top + p16,
          p16,
          0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_rounded),
                ),
                15.horizontal(),
                S24Text(isSettingScreen ? "Services" : "Choose Service"),
              ],
            ),
            15.vertical(),
            CommonSearchFiled(
              hintText: "Search Service",
              onSearch: (search) {},
            ),
            10.vertical(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(bottom: 60),
                itemBuilder: (context, index) {
                  return ServiceWidget(
                    onTap: () {
                      if (isSettingScreen) {
                        Get.to(const AddUpdateServiceScreen());
                      } else {
                        Get.back(result: true);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
