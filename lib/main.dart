import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:getx_tutorial_app/controller/network_controller.dart';
import 'package:getx_tutorial_app/screens/splash_screen.dart';
import 'package:getx_tutorial_app/utils/app_theme.dart';
import 'package:getx_tutorial_app/utils/app_translations.dart';
import 'package:getx_tutorial_app/widgets/offline_banner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // Register Network Controller
  Get.put(NetWorkController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),

          locale: const Locale('ur', 'PK'),

          fallbackLocale: const Locale('en', 'US'),

          // Global builder
          builder: (context, child) {
            if (child == null) {
              return const SizedBox.shrink();
            }
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                children: [
                  child,

                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: OfflineBanner(),
                  ),
                ],
              ),
            );
          },
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,

          // Don't use Obx here.
          // OfflineBanner handles network status.
          home: SplashScreen(),
        );
      },
    );
  }
}

// GetMaterialApp(
//   initialRoute: '/',
//   getPages: [
//     GetPage(
//       name: '/',
//       page: () => MyApp(),
//     ),
//     GetPage(
//       name: '/register',
//       page: () => RegisterScreen(),
//     ),
//     GetPage(
//       name: '/signing:some value',
//       page: () => SignInScreen(),
//     ),
//   ],
// );

//unKnownRoute : GetPage(name: "/notfound", page: () => UnKnownRoute()),

//Get.ofNamed("/register")
//Get.ofAllNamed("/register")
//Get.toNamed(----)
