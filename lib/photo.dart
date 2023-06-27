import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class Photo {
  final File imageFile;
  final String description;
  final String location;
  final String folder;

  Photo({
    required this.imageFile,
    required this.description,
    required this.location,
    required this.folder,
  });

  Future<void> saveToFirestore() async {
    try {
      final collection = FirebaseFirestore.instance.collection('photos');
      final document = collection.doc();

      await document.set({
        'description': description,
        'location': location,
        'folder': folder,
        // You can add additional fields as needed
      });

      // Upload the image file to Firebase Storage and get the download URL
      // ...

      // Update the Firestore document with the image download URL
      // ...

      print('Photo details saved to Firestore.');
    } catch (error) {
      print('Error saving photo details: $error');
    }
  }
}
