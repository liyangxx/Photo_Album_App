import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Photo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text('Take a Photo'),
              onPressed: () => _getImage(ImageSource.camera),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text('Choose from Album'),
              onPressed: () => _getImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
