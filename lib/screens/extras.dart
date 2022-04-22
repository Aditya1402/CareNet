import 'package:carenet/custom_widgets/date_picker_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Theming/customColors.dart';

String name = "";
String BG_val = 'Select a blood group';
String genderOption = 'Select gender';

class extras_screen extends StatefulWidget {
  const extras_screen({Key? key}) : super(key: key);

  @override
  State<extras_screen> createState() => _extras_screenState();
}

class _extras_screenState extends State<extras_screen> {

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
          child: Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/info.svg",
                    width: 35.w,
                  ),
                  Text("Information & Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Circular',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700)),

                  TextFormField(
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofocus: false,
                    validator: (value) {
                      if (value!.length > 20) {
                        return 'Name should be less than 20 characters';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'FULL NAME',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontSize: 18.sp,
                            color: CustomColors.grey2,
                            fontWeight: FontWeight.w500)),
                  ),
SizedBox(
                    height: 50,
                  ),
                  DropdownButton<String>(
                    value: genderOption,
                    items: <String>[
                      'Select gender',
                      'Male',
                      'Female',
                      'Other',
                      'Rather not say'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        genderOption = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DatePickerWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                  DropdownButton<String>(
                    value: BG_val,
                    items: <String>[
                      'Select a blood group',
                      'O+',
                      'O-',
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'AB+',
                      'AB-'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        BG_val = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 180.w,
                    child: ElevatedButton(
                        onPressed: () {
                          name = nameController.text;
                          createUser(name: name);
                        },
                        child: Text('Continue')),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

Future createUser({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

  final json = {
    'name': name,
    'birtday': date,
    'blood_group': BG_val,
    'gender': genderOption,
  };

  await docUser.set(json);
}
