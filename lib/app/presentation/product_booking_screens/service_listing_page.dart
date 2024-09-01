import 'package:salon_user/app/utils/all_dependency.dart';

class ServiceListingPage extends StatelessWidget {
  const ServiceListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppbar(
      title: AppStrings.serviceMenu,
      bottomWidget: const BottomBookNowWidget(isServiceList: true),
      padding: EdgeInsets.zero,
      children: [
        const OurServiceWidget(
          isTitle: false,
          padding: EdgeInsets.fromLTRB(p16, 15, p16, 8),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: p16,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ServiceContainer(index: index);
          },
        ),
      ],
    );
  }
}
