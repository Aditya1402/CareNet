import 'package:carenet/authentication/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: 
          Center(
            child: Column(
              children: [
                Text("Home Page", style: TextStyle(color: Colors.black),),
          
                ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text("Sign Out"))
              ],
            ),
          ),
        
      ),
    );
  }
}
