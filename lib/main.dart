import 'package:carenet/Screens/launchPage.dart';
import 'package:carenet/Theming/customTheme.dart';
import 'package:carenet/authentication/google_sign_in.dart';
import 'package:carenet/storage/cloudStorageTest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future main() async {
  // Binding Code
  WidgetsFlutterBinding.ensureInitialized();

  // Lock in Portrait Mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: ScreenUtilInit(
            designSize: Size(390, 844),
            splitScreenMode: true,
            minTextAdapt: true,
            builder: () => MaterialApp(
                navigatorKey: navigatorKey,
                title: "CareNet",
                debugShowCheckedModeBanner: false,
                theme: CustomTheme.lightTheme,
                home: SafeArea(child: CloudStoragePage()))));
  }
}
