import 'package:carenet/Screens/homePage.dart';
import 'package:carenet/Screens/infoPage.dart';
import 'package:carenet/Screens/launchPage.dart';
import 'package:carenet/authentication/email_login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EmailAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return HomePage();
            else if (snapshot.hasError)
              return Center(
                child: SnackBar(
                  content: Text("An error occured! Please try again."),
                ),
              );
              else if(snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(),); 
            else
              return LoginWidget();
          }),
    );
  }
}
