import 'package:carenet/Screens/launchPage.dart';
import 'package:carenet/Theming/customTheme.dart';
import 'package:carenet/screens/reminder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream
import '../widgets/themes.dart';

=======
import 'Theming/themes.dart';
>>>>>>> Stashed changes
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: () => MaterialApp(
// App Theming
              theme: LightTheme.lightTheme,
              darkTheme: DarkTheme.darkTheme,
              themeMode: ThemeMode.system,

              title: 'careNet',
              home: Reminder(),
            ));
  }
}
