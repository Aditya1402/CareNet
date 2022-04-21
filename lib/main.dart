import 'package:carenet/Screens/heart_rate_monitor/heartRateMonitor.dart';
import 'package:carenet/Screens/launchPage.dart';
import 'package:carenet/Theming/customTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: () => MaterialApp(

              title: "CareNet",
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.lightTheme,
              home: HeartRateMon()
            ));
  }
}
