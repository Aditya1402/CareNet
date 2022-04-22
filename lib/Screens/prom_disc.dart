import 'package:carenet/Theming/customColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromDisclosure extends StatefulWidget {
  const PromDisclosure({Key? key}) : super(key: key);

  @override
  State<PromDisclosure> createState() => _PromDisclosureState();
}

class _PromDisclosureState extends State<PromDisclosure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: 
          [
            SvgPicture.asset("assets/images/AppIcon.svg"),

            Text("Prominent Disclosure",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Circular',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700)),

            Text(
              "This app requires permission to help you securely store your medical records and other services. Provision of access needed for the following :",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("DOCUMENT STORAGE PERMISSIONS",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Circular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
            ),

            Row(
              children: 
              [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[300],
                    ),
                  padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w,6.h),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/location.svg",width: 14.w,),
                      SizedBox(width: 4.w,),
                      Text("Picture Gallery",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: CustomColors.grey1
                      )),
                    ],
                  ),
                )
              ],
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("LOCATION TRACKING & SERVICES",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Circular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text("REMINDER SERVICE",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Circular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),)),
    );
  }
}
