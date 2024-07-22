import 'package:salon_user/app/utils/all_dependancy.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Function()? onBackTap;
  final List<Widget> children;
  final EdgeInsets? padd;
  final Widget? bottomWidget;
  final Widget? appbarSuffix;
  const CommonAppbar({
    super.key,
    required this.title,
    this.padd,
    this.onBackTap,
    this.bottomWidget,
    required this.children,
    this.appbarSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomWidget,
      backgroundColor: AppColor.white,
      body: PopScope(
        onPopInvoked: (didPop) {
          if (onBackTap != null) {
            onBackTap!();
          }
        },
        child: Column(
          children: [
            (MediaQuery.of(context).padding.top).vertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: AppColor.grey100,
                    ),
                  ),
                ),
                S18Text(
                  title,
                  color: AppColor.grey100,
                  fontWeight: FontWeight.w700,
                ),
                if (appbarSuffix != null)
                  appbarSuffix!
                else
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                  ),
              ],
            ),
            const Divider(height: 5),
            Expanded(
              child: ListView(
                primary: false,
                padding: padd,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
