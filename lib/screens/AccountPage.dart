import 'package:flutter/material.dart';
import '../Firebase/GoogleSignIn.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(onPressed:(){
               final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
               provider.logout(context);
               }, child: Text('Sign Out'))
          ],
        ),
      )
    );
  }
}
