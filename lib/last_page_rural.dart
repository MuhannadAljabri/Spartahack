import "package:flutter/material.dart";





class SecondPage extends StatelessWidget {


  
  final List<String> selectedImages;

    
  

  SecondPage({required this.selectedImages});


    int userScore = 0;

  // Map to store deduction values for each image
  Map<String, int> imageDeductions = {
     'lib/bin/Cow.png' : -10,
    'lib/bin/tractor.png': -20, // Ensure this is the correct path.
    'lib/bin/Silo.png' : -25,
    'lib/bin/Solar_Panels.png' : 10,
    'lib/bin/Tree.png' : 20,
    'lib/bin/axe.png' : -7,
    'lib/bin/compost.png' : 10,
    'lib/bin/Organic_Fertilizer.png' : 5,
    'lib/bin/Chemical_Fertilizer.png': -5};

  Map<String, String> imageDeductionsReasons = {
    'lib/bin/Cow.png': 'Cows, like other ruminant animals, produce methane during digestion.',
    'lib/bin/tractor.png': 'Tractors can contribute to environmental degradation through fuel consumption, soil compaction, and emissions, impacting air and water quality.', // Ensure this is the correct path.
    'lib/bin/Silo.png' : 'Silos can contribute to environmental issues by promoting monoculture, reducing biodiversity',
    'lib/bin/Solar_Panels.png' : 'Solar panels are beneficial for the environment as they harness renewable energy from the sun, reducing dependence on fossil fuels',
    'lib/bin/Tree.png' : 'Trees are essential for the environment as they absorb carbon dioxide, release oxygen.',
    'lib/bin/axe.png' : 'Axes can lead to deforestation, habitat destruction, and loss of biodiversity.',
    'lib/bin/compost.png' : 'Compost enriches soil fertility, promotes healthier plant growth',
    'lib/bin/Organic_Fertilizer.png' : "Organic fertilizers enhance soil health, promote biodiversity, and reduce the risk of water pollution",
    'lib/bin/Chemical_Fertilizer.png': 'Chemical fertilizer contribute to soil degradation, water pollution, and disruption of ecosystems'};


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
      body: SingleChildScrollView(child:Column(
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
        Text("Your resulting points: ${updateScore()}")],
      ),)
    );
  }
}



