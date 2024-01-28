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
          Image.asset(
            'lib/bin/farm_field.jpg', // Replace with your image asset path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigates back to the previous screen
        },
        child: Icon(Icons.home), // Icon for the button
        tooltip: 'Go back to home', // Tooltip text on long press
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
        children: availableImages.map((imagePath) {
          // Extracting the image name from the path for displaying as text
          var imageName = imagePath.split('/').last.split('.').first;

          return ListTile(
            leading: Image.asset(
              imagePath,
              width: 40.0,
              height: 40.0,
            ),
            title: Text(imageName), // Display the image name here
            onTap: () => onImageSelected(imagePath),
          );
        }).toList(),
      ),
    );
  }
}
