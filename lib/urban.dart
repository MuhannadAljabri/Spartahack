import 'package:flutter/material.dart';
import 'package:msu_hackathon/last_page_urban.dart';

class UrbanPage extends StatefulWidget {
  @override
  _UrbanPageState createState() => _UrbanPageState();
}

class _UrbanPageState extends State<UrbanPage> {
  List<String> availableImages = [
    'lib/bin/Tesla.png',
    'lib/bin/Tree.png',
    'lib/bin/Gas_Truck.png',
    'lib/bin/Hydro_Car.png',
    'lib/bin/Street_Light.png',
    'lib/bin/Trash_Bin.png',
    'lib/bin/Recycle_Bin.png',
    'lib/bin/factory.png',
    'lib/bin/bicycle.png',
    'lib/bin/Solar_Panels.png',

  ];

  Map<String, Offset> imagePositions = {
    'lib/bin/Gas_Truck.png': Offset(500, 200),
    'lib/bin/Tesla.png': Offset(400,200),
    'lib/bin/Hydro_Car.png': Offset(300,200),
    'lib/bin/Street_Light.png': Offset(175,180),
    'lib/bin/Tree.png': Offset(75,200),
    'lib/bin/Trash_Bin.png': Offset(650,225),
    'lib/bin/Recycle_Bin.png': Offset(550,200),
    'lib/bin/factory.png': Offset(320,160),
    'lib/bin/bicycle.png': Offset(250,200),
    'lib/bin/Solar_Panels.png': Offset(600,35),

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/bin/city.jpg'),
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
      floatingActionButton: buildFloatingActionButton()
    );
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
              builder: (context) => ThirdPage(selectedImages: selectedImages),
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
