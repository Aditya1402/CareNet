import 'package:carenet/authentication/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Strings.dart';
import '../Theming/customColors.dart';
import 'email_login_widget.dart';

class SignUpWidget extends StatefulWidget {
  final Function onClickedSignIn;
  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
                child: Text(
                  Strings.signUp,
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
                    color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) => input!.isValidEmail()
                    ? null
                    : "Enter a valid email address",
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
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return "Please enter password";
                  return null;
                },
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
                    onPressed: () {
                      onPressed:

                      // conditionals here
                      if (formGlobalKey.currentState!.validate()) {
                        print("Success");
                      } else
                        print("Unsucessfull");
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.button,
                      ),
                    )),
              ),

              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
