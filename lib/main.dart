import 'package:flutter/material.dart';
import 'package:photo_album_app/screens/pin_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PhotoAlbumApp());
}

class PhotoAlbumApp extends StatelessWidget {
  const PhotoAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Album App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 220, 107, 109),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 220, 107, 109),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 220, 107, 109),
            ),
          ),
        ),
      ),
      home: PinScreen(),
    );
  }
}
