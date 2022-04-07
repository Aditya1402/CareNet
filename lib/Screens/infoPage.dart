import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: 
          [
            SvgPicture.asset("assets/images/info.svg",width: 35.w,),

            Builder(
              builder: (context) {
                return Text("Please provide details",
                style: Theme.of(context).textTheme.headline1);
              }
            ),

            TextFormField(),

            TextFormField()
          ],
        ),
      )),
    );
  }
}
