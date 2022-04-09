import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

                ElevatedButton(onPressed: ()=>FirebaseAuth.instance.signOut(), child: Text("Sign Out"))
              ],
            ),
          ),
        
      ),
    );
  }
}
