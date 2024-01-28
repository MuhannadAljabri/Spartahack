import 'package:flutter/material.dart';
import 'last_page.dart';

class RuralPage extends StatefulWidget {
  @override
  _RuralPageState createState() => _RuralPageState();
}

class _RuralPageState extends State<RuralPage> {
  List<String> availableImages = [
    'lib/bin/Cow.png',
    'lib/bin/tractor.png',
    'lib/bin/Silo.jpg',
    'lib/bin/Solar_Panels.png'
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
          Image.asset(
            'lib/bin/Farm Field.jpg', // Replace with your image asset path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          for (var imagePath in selectedImages)
            Positioned(
              left: 50.0 + selectedImages.indexOf(imagePath) * 100.0,
              top: 75.0,
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
      FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigates back to the previous screen
        },
        child: Icon(Icons.home), // Icon for the button
        tooltip: 'Go back to home', // Tooltip text on long press
      ),
      SizedBox(height: 10,),
      FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the new page and pass selectedImages
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(selectedImages: selectedImages),
            ),
          );
        },
        label: Text('Simulate'),
        icon: Icon(Icons.navigate_next),
        backgroundColor: Colors.blue,
      ),]
    )
      
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
              leading: Image.asset(
                imagePath,
                width: 40.0,
                height: 40.0,
              ),
              title: Text(imagePath.split('/').last.split('.').first)
,
              onTap: () => onImageSelected(imagePath),
            ),
        ],
      ),
    );
  }
}
