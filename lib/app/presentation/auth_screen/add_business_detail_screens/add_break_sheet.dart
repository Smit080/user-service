import 'package:salon_user/app/utils/all_dependency.dart';

class AddBreakSheet extends StatefulWidget {
  final String? toTime;
  final String? fromTime;
  const AddBreakSheet({super.key, this.toTime, this.fromTime});

  @override
  State<AddBreakSheet> createState() => _AddBreakSheetState();
}

class _AddBreakSheetState extends State<AddBreakSheet> {
  AuthController controller = Get.find<AuthController>();
  List<String> toTime = [];
  List<String> fromTime = [];
  String selectedToTime = "";
  String selectedFromTime = "";

  @override
  void initState() {
    for (int i = 0; i < 288; i++) {
      int startIndex = controller.toTimeList.indexOf(controller.selectedToTime);
      int endIndex = controller.toTimeList.indexOf(controller.selectedFromTime);
      if (startIndex < i && endIndex >= i) {
        toTime.add(controller.toTimeList[i]);
        fromTime.add(controller.toTimeList[i]);
      }
    }
    selectedToTime = toTime[toTime.length ~/ 2];
    selectedFromTime = fromTime[(fromTime.length ~/ 2) + 1];
    super.initState();
  }

  // String toTime = ;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: ColoredBox(
        color: AppColor.white,
        child: Padding(
          padding: const EdgeInsets.all(p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SText(
                "Monday ● Breaks",
                size: 26,
                fontWeight: FontWeight.w700,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      VerticalPicker(
                        list: toTime,
                        selectedTime: selectedToTime,
                        onChange: (value) {
                          setState(() {
                            selectedToTime = value;
                          });
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
                        list: fromTime,
                        selectedTime: selectedFromTime,
                        onChange: (value) {
                          setState(() {
                            selectedFromTime = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CommonBtn(
                text: "Add",
                borderRad: 10,
                onTap: () {
                  controller.breaksList
                      .add("$selectedToTime - $selectedFromTime");
                  controller.update();
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
