import 'package:carenet/Theming/customColors.dart';
import 'package:carenet/custom_widgets/launchPageMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.h,
              ),
              SvgPicture.asset(
                "assets/images/AppIcon.svg",
                width: 110.w,
              ),
              SizedBox(
                height: 40.h,
              ),
              Builder(builder: (context) {
                return Text(
                  "Welcome to CareNet",
                  style: Theme.of(context).textTheme.headline1,
                );
              }),
              SizedBox(
                height: 50.h,
              ),

              LaunchPageMenu(),
              
              SizedBox(
                height: 80.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(45.w, 12.h, 45.w, 12.h)),
                onPressed: () {},
                child: Builder(builder: (context) {
                  return Text(
                    "Join CareNet",
                    style: Theme.of(context).textTheme.bodyText2,
                  );
                }),
              ),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Builder(builder: (context) {
                    return Text(
                      "Login with Google",
                      style: TextStyle(
                          color: CustomColors.bluebell,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    );
                  }),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200),
                              side:
                                  BorderSide(color: CustomColors.bluebell))))),
            ],
          ),
        ),
      ),
    );
  }
}
