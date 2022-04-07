import 'package:carenet/Firebase/SignInCheck.dart';
import 'package:flutter/material.dart';
import '../widgets/themes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

// App Theming 
      theme: 
      LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SignInCheck(),
      title: "CareNet",
    
    );
  }
}
