import "package:flutter/material.dart";

class SecondPage extends StatelessWidget {
  final List<String> selectedImages;

  SecondPage({required this.selectedImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your results"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Selected objects for a rural environment:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          // Display selected images
          for (var imagePath in selectedImages)
            Row(children: [Image.asset(
              imagePath,
              width: 100.0,
              height: 100.0,
            ), SizedBox(width: 40,), 
          ])
        ],
      ),
    );
  }
}