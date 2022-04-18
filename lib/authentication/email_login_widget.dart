import 'package:carenet/Strings.dart';
import 'package:carenet/Theming/customColors.dart';
import 'package:carenet/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
              child: Text(
                Strings.signIn,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),

            SizedBox(
              height: 36.h,
            ),

            // EMAIL ADDRESS
            TextFormField(
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  ),
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

            SizedBox(height: 15.h),

            // PASSWORD
            TextFormField(
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_passwordVisible,
              controller: passwordController,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => setState(
                      () => _passwordVisible = !_passwordVisible,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 15.h, 0, 0),
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: CustomColors.grey2,
                        size: 18,
                      ),
                    ),
                  ),
                  labelText: 'PASSWORD',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                      fontSize: 18.sp,
                      color: CustomColors.grey2,
                      fontWeight: FontWeight.w500)),
            ),

            SizedBox(height: 3.h),

            Padding(
              padding: EdgeInsets.fromLTRB(219.w, 0, 0, 0),
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text("Forgot Password?",
                      style: Theme.of(context).textTheme.subtitle1)),
            ),

            SizedBox(
              height: 30.h,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => signIn(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.button,
                    ),
                  )),
            ),

            SizedBox(height: 5.h),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text("Create Account",
                      style: Theme.of(context).textTheme.subtitle1)),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
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
  // Navigator.of(context) won't work -> Need to figure out

}
