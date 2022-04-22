import 'package:carenet/authentication/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Theming/customColors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center
      (
        child: Align(alignment: Alignment.center,
        child: Padding(
          padding:  EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
          child: Column(children: 
          [
            SvgPicture.asset("assets/images/forgotPassword.svg"),

            Text("Forgot your password?",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Circular',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700
            )),

            SizedBox(
              width: 250.w,
              child: Text("Enter your email address to retreive your password!", 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,)),

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


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 2.h, 0, 2.h),
                        child: Text(
                          "RESET PASSWORD",
                          style: Theme.of(context).textTheme.button,
                        ),
                      )),
                ),
            
          ]),
        ),),
      )),
    );
  }
}