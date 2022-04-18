import 'package:carenet/storage/storageService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloudStoragePage extends StatefulWidget {
  const CloudStoragePage({Key? key}) : super(key: key);

  @override
  State<CloudStoragePage> createState() => _CloudStoragePageState();
}

class _CloudStoragePageState extends State<CloudStoragePage> {
  @override
  Widget build(BuildContext context) {
    /////
    final Storage storage = Storage();

    /////
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'png', 'jpeg', 'jpg']);

                  if (results == null)
                    ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          backgroundColor: Colors.red,
                          content: Row(
                            children: [
                              Icon(Icons.error, color: Colors.white, size: 20,),
                              SizedBox(width: 7),
                              Text('No file has been selected.'),
                            ],
                          )
                          )
                          );
                  else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar( 
                          SnackBar(
                            backgroundColor: Colors.green,
                          duration:  Duration(seconds: 3),
                          content: Row(
                            children: [
                              Icon(Icons.done, color: Colors.white, size: 20,),
                              SizedBox(width: 7),
                              Text("File uploaded successfully."),
                            ],
                          )));
                  }

                  final path = results?.files.single.path!;
                  final fileName = results!.files.single.name;

                  storage
                      .uploadFile(path!, fileName)
                      .then((value) => print("DONE"));
                },
                child: Text("Upload File"))
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}

