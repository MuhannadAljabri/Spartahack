import 'package:flutter/material.dart';

class UrbanPage extends StatefulWidget {
  @override
  _UrbanPageState createState() => _UrbanPageState();
}

class _UrbanPageState extends State<UrbanPage> {
  List<String> availableImages = [
    'lib/bin/EV.svg',
    'lib/bin/factory.svg',
    'lib/bin/gascar.png',
    'lib/bin/hydcar.png',
    'lib/bin/streetlight.svg',
    'lib/bin/trash-bin.png',
  ];

  // Corrected Map declaration
  Map<String, Offset> imagePositions = {
    'lib/bin/gascar.png': Offset(500, 200),
    // Add other images and their positions here
  };

  // Adding selectedImages as a List<String>
  List<String> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(
        availableImages: availableImages,
        onImageSelected: (String imagePath) {
          setState(() {
            availableImages.remove(imagePath);
            selectedImages.add(imagePath);
          });
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/bin/city.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: selectedImages.map((imagePath) {
            final position = imagePositions[imagePath] ?? Offset(0, 0);
            return Positioned(
              left: position.dx,
              top: position.dy,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages.remove(imagePath);
                    availableImages.add(imagePath);
                  });
                },
                child: Image.asset(
                  imagePath,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            );
          }).toList(),
        ),
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
          var imageName = imagePath.split('/').last.split('.').first;
          return ListTile(
            leading: Image.asset(
              imagePath,
              width: 40.0,
              height: 40.0,
            ),
            title: Text(imageName),
            onTap: () => onImageSelected(imagePath),
          );
        }).toList(),
      ),
    );
  }
}
