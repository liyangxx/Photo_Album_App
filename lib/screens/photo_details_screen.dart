import 'dart:io';
import 'package:flutter/material.dart';
import 'package:exif/exif.dart';
import 'package:photo_album_app/photo.dart';

class PhotoDetailsScreen extends StatefulWidget {
  final File imageFile;
  final Function(Photo) onSave;

  const PhotoDetailsScreen({required this.imageFile, required this.onSave});

  @override
  _PhotoDetailsScreenState createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _folderController = TextEditingController();
  String? _currentLocation;
  String? _dateTime;

  @override
  void initState() {
    super.initState();
    extractImageMetadata();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _folderController.dispose();
    super.dispose();
  }

  Future<void> extractImageMetadata() async {
    File imageFile = widget.imageFile;

    final bytes = await imageFile.readAsBytes();
    final tags = await readExifFromBytes(bytes);

    setState(() {
      _currentLocation = tags['GPS']?.toString() ?? 'Unknown';
      _dateTime = tags['DateTimeOriginal']?.toString() ?? 'Unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(widget.imageFile, fit: BoxFit.cover),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Location: ${_currentLocation ?? 'Unknown'}'),
            SizedBox(height: 8.0),
            Text('Date and Time: ${_dateTime ?? 'Unknown'}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                final photo = Photo(
                  imageFile: widget.imageFile,
                  description: _descriptionController.text,
                  location: _currentLocation ?? '',
                  folder: _folderController.text,
                );

                photo.saveToFirestore();
                widget.onSave(photo); // Call the onSave callback
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
