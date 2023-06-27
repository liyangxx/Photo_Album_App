import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_album_app/screens/add_photo_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<String> photoAssets = [
    'assets/photo1.jpg',
    'assets/photo2.jpg',
    'assets/photo3.jpg',
    'assets/photo4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 220, 107, 109),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Your Recent Photos',
                    style: GoogleFonts.lobster(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: photoAssets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildPhotoItem(photoAssets[index]);
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  child: const Text('Add Photo'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPhotoScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoItem(String assetPath) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
