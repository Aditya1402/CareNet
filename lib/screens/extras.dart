import 'package:carenet/custom_widgets/date_picker_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late String name;
String BG_val = 'Select a blood group';
String genderOption = 'Select gender';

class extras_screen extends StatefulWidget {
  const extras_screen({Key? key}) : super(key: key);

  @override
  State<extras_screen> createState() => _extras_screenState();
}

class _extras_screenState extends State<extras_screen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name ',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.length > 20) {
                  return 'Name should be less than 20 characters';
                } else {
                  return value = name;
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            DropdownButton<String>(
              value: genderOption,
              items: <String>[
                'Select gender',
                'male',
                'female',
                'other',
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
            ElevatedButton(
                onPressed: () {
                  final name = controller.text;
                  createUser(name: name);
                },
                child: Text('Submit'))
          ]),
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
