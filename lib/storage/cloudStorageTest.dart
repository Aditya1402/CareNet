import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CloudStoragePage extends StatefulWidget {
  const CloudStoragePage({Key? key}) : super(key: key);

  @override
  State<CloudStoragePage> createState() => _CloudStoragePageState();
}

class _CloudStoragePageState extends State<CloudStoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final results = await FilePicker.platform
                      .pickFiles(allowMultiple: false, type: FileType.image);

                  if (results == null)
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Null Nada')));

                  final path = results?.files.single.path!;
                  final name = results?.files.single.name!;
                },
                child: Text("Upload File"))
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}
