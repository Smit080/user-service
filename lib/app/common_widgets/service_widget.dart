import 'package:salon_user/app/utils/all_dependency.dart';

class ServiceWidget extends StatelessWidget {
  final Function() onTap;
  final bool isSelect;
  const ServiceWidget({super.key, required this.onTap, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelect ? null : onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: isSelect ? 0 : 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColor.grey100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
                    height: 40,
                    width: 2,
                  ),
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    S16Text(
                      "Service name",
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey100,
                    ),
                    S12Text("30 min"),
                  ],
                ),
              ),
              const Spacer(),
              const S18Text("${AppStrings.rupee} 150")
            ],
          ),
        ),
      ),
    );
  }
}
