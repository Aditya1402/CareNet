import 'package:carenet/Theming/customColors.dart';
import 'package:carenet/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
      child: Column(
        children: [
          Text(
            "Sign Up",
            style: Theme.of(context).textTheme.headline2,
          ),

          // EMAIL ADDRESS
          TextFormField(
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'EMAIL',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                    fontSize: 18.sp,
                    color: CustomColors.grey2,
                    fontWeight: FontWeight.w500)),
          ),

          // PASSWORD
          TextFormField(
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !_passwordVisible,
            controller: passwordController,
            decoration: InputDecoration(
                suffix: IconButton(
                  color: Colors.amber,
                  splashColor: Colors.transparent,
                  icon: _passwordVisible
                      ? Icon(
                          FontAwesomeIcons.eye,
                          color: CustomColors.grey2,
                          size: 17.w,
                        )
                      : Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 2.5.w, 0),
                          child: Icon(
                            FontAwesomeIcons.eyeSlash,
                            color: CustomColors.grey2,
                            size: 17.w,
                          ),
                        ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                labelText: 'PASSWORD',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                    fontSize: 18.sp,
                    color: CustomColors.grey2,
                    fontWeight: FontWeight.w500)),
          ),

          ElevatedButton(onPressed: () => signIn(), child: Text("SIGN IN"))
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  // Navigator.of(context) won't work -> Need to fighue out
  
}
