import 'package:flutter/material.dart';
import 'last_page_rural.dart'; // Ensure this import is correct.

class RuralPage extends StatefulWidget {
  @override
  _RuralPageState createState() => _RuralPageState();
}

class _RuralPageState extends State<RuralPage> {
  List<String> availableImages = [
    'lib/bin/Cow.png',
    'lib/bin/tractor.png', // Ensure this is the correct path.
    'lib/bin/Silo.png',
    'lib/bin/Solar_Panels.png',
    'lib/bin/Tree.png',
    'lib/bin/axe.png',
    'lib/bin/compost.png',
    'lib/bin/Organic_Fertilizer.png',
    'lib/bin/Chemical_Fertilizer.png',
  ];

  Map<String, Offset> imagePositions = {
    'lib/bin/Cow.png': Offset(500, 200),
    'lib/bin/tractor.png': Offset(200,200),
    'lib/bin/Silo.png': Offset(200,50),
    'lib/bin/Solar_Panels.png': Offset(500,5),
    'lib/bin/Tree.png': Offset(75,200),
    'lib/bin/axe.png': Offset(650,225),
    'lib/bin/compost.png': Offset(450,150),
    'lib/bin/Organic_Fertilizer.png': Offset(100,50),
    'lib/bin/Chemical_Fertilizer.png': Offset(250,60),

    // Add other images and their positions here
  };
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
      body: Stack(children: buildStackedImages()),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

List<Widget> buildStackedImages() {
  var backgroundImage = Image.asset(
    'lib/bin/Farm Field.jpg',
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
  );

  var imageWidgets = <Widget>[backgroundImage];

  imageWidgets.addAll(selectedImages.map((imagePath) {
    final position = imagePositions[imagePath] ?? Offset(0, 0); // Use the position from the map
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Remove the image from selectedImages and add it back to availableImages
            selectedImages.remove(imagePath);
            availableImages.add(imagePath);
          });
        },
        child: Image.asset(imagePath, width: 100.0, height: 100.0),
      ),
    );
  }).toList());

  return imageWidgets;
}


  Widget buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.home),
          tooltip: 'Go back to home',
        ),
        SizedBox(height: 10),
        FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(selectedImages: selectedImages),
            ),
          ),
          label: Text('Simulate'),
          icon: Icon(Icons.navigate_next),
          backgroundColor: Colors.blue,
        ),
      ],
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
        children: availableImages.map((imagePath) => ListTile(
              leading: Image.asset(imagePath, width: 40.0, height: 40.0),
              title: Text(imagePath.split('/').last.split('.').first),
              onTap: () => onImageSelected(imagePath),
            )).toList(),
      ),
    );
  }
}
