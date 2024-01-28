import 'package:flutter/material.dart';

class RuralPage extends StatefulWidget {
  @override
  _RuralPageState createState() => _RuralPageState();
}

class _RuralPageState extends State<RuralPage> {

  List<String> availableImages = [
    'lib/bin/cows.png',
    'lib/bin/tractor.png',
    'lib/bin/',
    'assets/image4.png',
    'assets/image5.png',
  ];

  List<String> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Placement"),
      ),
      drawer: AppDrawer(
        availableImages: availableImages,
        onImageSelected: (String imagePath) {
          setState(() {
            availableImages.remove(imagePath);
            selectedImages.add(imagePath);
          });
        },
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'lib/bin/farm_field.jpg', // Replace with your image asset path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Placed images
          for (var imagePath in selectedImages)
            Positioned(
              left: 50.0 + selectedImages.indexOf(imagePath) * 100.0,
              top: 50.0,
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
              ),
            ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final List<String> availableImages;
  final Function(String) onImageSelected;

  AppDrawer({required this.availableImages, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          for (var imagePath in availableImages)
            ListTile(
              title: Image.asset(
                imagePath,
                width: 40.0,
                height: 40.0,
              ),
              onTap: () => onImageSelected(imagePath),
            ),
        ],
      ),
    );
  }
}
