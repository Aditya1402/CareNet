import 'package:carenet/Screens/extras.dart';
import 'package:carenet/Screens/profile.dart';
import 'package:carenet/authentication/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
       
          preferredSize: Size.fromHeight(70.h),
          child: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage())),
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(10.w, 10.h, 20.w, 0),
                  child: CircleAvatar(
                    radius: 18.w,
                    backgroundImage: NetworkImage(user!.photoURL!)
                    
                  ),
                ),
              )
            ],
          ),
          
        ),
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
