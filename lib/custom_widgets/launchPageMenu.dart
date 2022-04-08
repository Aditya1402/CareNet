import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LaunchPageMenu extends StatelessWidget {
  double icon_width = 14.w;
  double icon_spacing = 10.w;
  double line_spacing = 5.h;
  double menu_left_spacing = 85.w;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: menu_left_spacing),
            SvgPicture.asset(
              "assets/images/download.svg",
              width: icon_width,
            ),
            SizedBox(
              width: icon_spacing,
            ),
            Builder(builder: (context) {
              return Text("Store medical records",
                  style: Theme.of(context).textTheme.bodyText1);
            })
          ],
        ),
        SizedBox(height: line_spacing),
        Row(
          children: [
            SizedBox(width: menu_left_spacing),
            SvgPicture.asset(
              "assets/images/location.svg",
              width: icon_width,
            ),
            SizedBox(
              width: icon_spacing,
            ),
            Builder(builder: (context) {
              return Text("Live Location Tracking & History",
                  style: Theme.of(context).textTheme.bodyText1);
            })
          ],
        ),
        SizedBox(height: line_spacing),
        Row(
          children: [
            SizedBox(width: menu_left_spacing),
            SvgPicture.asset(
              "assets/images/bills.svg",
              width: icon_width,
            ),
            SizedBox(
              width: icon_spacing,
            ),
            Builder(builder: (context) {
              return Text("Utility Bill Payments",
                  style: Theme.of(context).textTheme.bodyText1);
            })
          ],
        ),
        SizedBox(height: line_spacing),
        Row(
          children: [
            SizedBox(width: menu_left_spacing),
            SvgPicture.asset(
              "assets/images/pills.svg",
              width: icon_width,
            ),
            SizedBox(
              width: icon_spacing,
            ),
            Builder(builder: (context) {
              return Text("Pill Reminders",
                  style: Theme.of(context).textTheme.bodyText1);
            })
          ],
        ),
      ],
    );
  }
}
