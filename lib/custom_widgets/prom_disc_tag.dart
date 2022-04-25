import 'package:carenet/screens/homePage.dart';
import 'package:carenet/screens/prom_disc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:after_layout/after_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Theming/customColors.dart';

class Tag extends StatefulWidget {
  Tag(this.svg_path, this.tag_text);
  String svg_path;
  String tag_text;

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> with AfterLayoutMixin {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => PromDisclosure()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 6.h),
      child: Row(
        children: [
          SvgPicture.asset(
            widget.svg_path,
            width: 16.w,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(widget.tag_text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: CustomColors.grey1)),
        ],
      ),
    );
  }
}
