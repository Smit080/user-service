import 'package:device_preview/device_preview.dart';

import 'app/utils/all_dependancy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Helper.darkTheme();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Salon User',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        fontFamily: "Nunito",
      ),
      getPages: AppPages.routes,
    );
  }
}
