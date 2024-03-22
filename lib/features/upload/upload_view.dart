import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/iamge_assets.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/widgets/custom_elev_button.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  pushWithReplacement(context, const HomeView());
                  box.put('name', name);
                  box.put('Image', path);
                  box.put('isUploaded', true);
                } else if (path != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Enter Your Name'),
                    backgroundColor: Colors.red,
                  ));
                } else if (path == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Upload Your Image'),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('Please Enter Your Name and Upload Your Image'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : AssetImage(ImagesAssets.image1),
                  radius: 60,
                ),
                const Gap(20),
                custom_elev_button(
                  onPressed: () => uploadImage(isCamera: true),
                  text: 'Upload From Camera',
                  width: 250,
                ),
                const Gap(20),
                custom_elev_button(
                  onPressed: () => uploadImage(isCamera: false),
                  text: 'Upload From Gallery',
                  width: 250,
                ),
                const Gap(20),
                const Divider(
                  endIndent: 40,
                  indent: 40,
                ),
                const Gap(20),
                TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration:
                        const InputDecoration(hintText: 'Enter Your Name'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage({required isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
