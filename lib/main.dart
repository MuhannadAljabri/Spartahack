import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msu_hackathon/rural.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/',
      // Routes
      routes: {
        '/': (context) =>  MyHomePage(),
        'rural_page':(context) =>  RuralPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showStartButton = true;

  @override
  Widget build(BuildContext context) {
    // Force landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Hide system overlays
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      body: Center(
        child: showStartButton
            ? Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showStartButton = false;
                    });
                  },
                  
                  child: Text("Start"),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle button 1 press
                      print("Button 1 pressed!");
                    },
                    child: Container(
                      child: Center(child: Text("Urban")),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,))
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button 2 press
                      Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RuralPage(),
              ));
                    },
                    child: Container(
                      child: Center(child:Text("Rural")),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,)
                  ),)
                ],
              ),
      ),
    );
  }
}
