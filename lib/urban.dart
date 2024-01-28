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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: AppDrawer(
        availableImages: availableImages,
        onImageSelected: (String imagePath) {
          // Implement your logic for image selection here
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Add more widgets as needed
            ],
          ),
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

