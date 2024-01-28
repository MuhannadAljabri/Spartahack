import "package:flutter/material.dart";





class SecondPage extends StatelessWidget {


  
  final List<String> selectedImages;

    int userScore = 100;

  // Map to store deduction values for each image
  Map<String, int> imageDeductions = {
    'lib/bin/Cow.png': -10,
    'assets/image2.png': 20,
    'assets/image3.png': 15,
    'assets/image4.png': 25,
    'assets/image5.png': 30,};

  Map<String, String> imageDeductionsReasons = {
    'lib/bin/Cow.png': 'Cows, like other ruminant animals, produce methane during digestion. Methane is a potent greenhouse gas that contributes to global warming. The livestock sector, including cows, is a significant source of methane emissions.'};
    
  
  

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
        Text("data")],
      ),
    );
  }
}

  
