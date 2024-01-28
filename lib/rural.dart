import 'package:flutter/material.dart';
import 'last_page.dart'; // Ensure this import is correct.

class RuralPage extends StatefulWidget {
  @override
  _RuralPageState createState() => _RuralPageState();
}

class _RuralPageState extends State<RuralPage> {
  List<String> availableImages = [
    'lib/bin/Cow.png',
    'lib/bin/tractor.png', // Ensure this is the correct path.
    'lib/bin/Silo.jpg',
    'lib/bin/Solar_Panels.png',
    'lib/bin/Tree.png',
    'lib/bin/axe.png',
    'lib/bin/compost.png',
    'lib/bin/Organic_Fertilizer.jpg',
    'lib/bin/Chemical_Fertilizer.png',
  ];

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

  imageWidgets.addAll(List<Widget>.generate(selectedImages.length, (index) {
    String imagePath = selectedImages[index];
    return Positioned(
      left: 50.0 + index * 100.0,
      top: 75.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Remove the image from selectedImages and add it back to availableImages
            selectedImages.removeAt(index);
            availableImages.add(imagePath);
          });
        },
        child: Image.asset(imagePath, width: 100.0, height: 100.0),
      ),
    );
  }));

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
