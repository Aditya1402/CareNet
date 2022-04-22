import 'package:carenet/authentication/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(user!.photoURL!)),
          Text(
            user.email!,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            user.displayName!,
            style: TextStyle(color: Colors.black),
          ),
          ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text("Sign Out"))
        ],
      )),
    ));
  }
}
