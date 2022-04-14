import 'package:carenet/Screens/launchPage.dart';
import 'package:carenet/Theming/customColors.dart';
import 'package:carenet/Theming/customTheme.dart';
import 'package:carenet/screens/reminder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'Theming/themes.dart';

void main() {
  //Initialize notification service

  AwesomeNotifications().initialize(
    'resource://drawable-hdpi/branding',
    [
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: CustomColors.bluebell,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
        channelDescription: 'Scheduled Notifications for Reminder',
      ),
    ],
  );
  runApp(MyApp());
}

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
