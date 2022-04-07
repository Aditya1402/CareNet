import 'package:carenet/Theming/customTheme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CareNet",
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Join CareNet")),
          ],
        )),
      ),
    );
  }
}