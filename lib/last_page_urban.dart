import "package:flutter/material.dart";





class ThirdPage extends StatelessWidget {


  
  final List<String> selectedImages;

    
  

  ThirdPage({required this.selectedImages});


    int userScore = 100;

  // Map to store deduction values for each image
  Map<String, int> imageDeductions = {
    'lib/bin/Gas_Truck.png': -20,
    'lib/bin/Tesla.png': -5,
    'lib/bin/Hydro_Car.png': 10,
    'lib/bin/Street_Light.png': -7,
    'lib/bin/Tree.png': 10,
    'lib/bin/Trash_Bin.png': 5,
    'lib/bin/Recycle_Bin.png': 15,
    'lib/bin/factory.png': -30,
    'lib/bin/bicycle.png': 12,
    'lib/bin/Solar_Panels.png': 10};

  Map<String, String> imageDeductionsReasons = {
    'lib/bin/Gas_Truck.png': 'Gas trucks contribute to environmental harm through the emission of pollutants.',
    'lib/bin/Tesla.png': 'While electric cars are considered more environmentally friendly, their production involves resource extraction.',
    'lib/bin/Hydro_Car.png': 'Hydrogen cars are considered environmentally beneficial as they produce zero emissions during operation',
    'lib/bin/Street_Light.png': 'Street lights for can contribute to environmental harm through light pollution, disrupting ecosystems',
    'lib/bin/Tree.png': 'Trees are essential for the environment as they absorb carbon dioxide, release oxygen.',
    'lib/bin/Trash_Bin.png': 'Trash bins are beneficial for the environment as they facilitate proper waste disposal, preventing littering',
    'lib/bin/Recycle_Bin.png': 'Recycle bins are essential for the environment as they encourage the proper disposal and recycling of materials, reducing landfill waste.',
    'lib/bin/factory.png': 'Factories contribute to environmental harm through air and water pollution, deforestation, and resource depletion.',
    'lib/bin/bicycle.png': 'Bicycles are environmentally friendly as they produce no emissions, reduce traffic congestion.',
    'lib/bin/Solar_Panels.png': 'Solar panels are beneficial for the environment as they harness renewable energy, reducing reliance on fossil fuels.',};


int updateScore() {
    // Update user score based on the selected images
    for (var imagePath in selectedImages) {
      userScore += imageDeductions[imagePath] ?? 0;
    }
  return userScore;
  }



  

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
          SizedBox(height: 10.0),
          // Display selected images

          for (var imagePath in selectedImages)
            Row(children: [Image.asset(
              imagePath,
              width: 60.0,
              height: 60.0,
            ), SizedBox(width: 40,),
             Container(height: 60, width: 650 ,child: Text(imageDeductionsReasons[imagePath].toString())),
             SizedBox(width: 40,), Text(imageDeductions[imagePath].toString(),) 
          ]),
        Text("Your resulting points: ${updateScore().clamp(0, 100)}")],
      ),
    );
  }
}



