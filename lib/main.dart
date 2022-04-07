import 'package:carenet/Firebase/SignInCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/themes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: () =>MaterialApp(

// App Theming 
      theme: 
      LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SignInCheck(),
      title: "CareNet",
    
    ));
  }
}
