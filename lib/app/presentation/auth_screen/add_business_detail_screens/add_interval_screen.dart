import 'package:salon_user/app/utils/all_dependency.dart';

class AddIntervalScreen extends StatefulWidget {
  const AddIntervalScreen({super.key});

  @override
  State<AddIntervalScreen> createState() => _AddIntervalScreenState();
}

class _AddIntervalScreenState extends State<AddIntervalScreen> {
  AuthController controller = Get.find<AuthController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addTime();
      controller.isClose = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.selectedToTime = "10:00 AM";
    controller.selectedFromTime = "07:00 PM";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(p16),
            child: CommonBtn(
              borderRad: 10,
              borderColor: AppColor.grey100,
              btnColor: AppColor.grey100,
              text: AppStrings.ok,
              onTap: () {
                if (controller.indicatorValue == 1 / 3) {
                  controller.indicatorValue = 2 / 3;
                } else if (controller.indicatorValue == 2 / 3) {
                  controller.indicatorValue = 1;
                }
                controller.update();
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: p16, left: p16),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 25,
                  color: AppColor.grey100,
                ),
              ),
            ),
            20.vertical(),
            GetBuilder<AuthController>(
              builder: (controller) {
                return Expanded(
                  child: ListView(
                    primary: false,
                    padding: const EdgeInsets.symmetric(horizontal: p16),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SText(
                            "Monday",
                            size: 26,
                            fontWeight: FontWeight.w700,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: SText(
                              controller.isClose ? "Close" : "Open",
                              size: 10,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomSwitch(
                                value: !controller.isClose,
                                onChanged: (value) {
                                  controller.isClose = !value;
                                  controller.update();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (!controller.isClose)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            height: 250,
                            child: Row(
                              children: [
                                VerticalPicker(
                                  list: controller.toTimeList,
                                  selectedTime: controller.selectedToTime,
                                  onChange: (value) {
                                    controller.selectedToTime = value;
                                    controller.update();
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                VerticalPicker(
                                  list: controller.toTimeList,
                                  selectedTime: controller.selectedFromTime,
                                  onChange: (value) {
                                    controller.selectedFromTime = value;
                                    controller.update();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!controller.isClose)
                        const S18Text(
                          AppStrings.breaks,
                          fontWeight: FontWeight.w700,
                        ),
                      if (!controller.isClose)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.breaksList.length + 1,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            bool isAdd = index == controller.breaksList.length;
                            return GestureDetector(
                              onTap: () {
                                Get.bottomSheet(const AddBreakSheet());
                              },
                              child: ColoredBox(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: isAdd
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.spaceBetween,
                                        children: isAdd
                                            ? [
                                                const Icon(
                                                  Icons.add,
                                                  color: AppColor.primaryColor,
                                                ),
                                                15.horizontal(),
                                                const S16Text("Add break"),
                                              ]
                                            : [
                                                S16Text(
                                                  controller.breaksList[index],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                      ..breaksList
                                                          .removeAt(index)
                                                      ..update();
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    size: 18,
                                                    color: AppColor.redColor,
                                                  ),
                                                ),
                                              ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
