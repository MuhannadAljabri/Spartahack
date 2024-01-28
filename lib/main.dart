import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msu_hackathon/rural.dart';
import 'package:msu_hackathon/urban.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'rural_page': (context) => RuralPage(),
        'urban_page': (context) => UrbanPage(),
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
    _setOrientationAndUIConfig();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showStartButton) ...[
              _buildTitleAndDescription(),
              SizedBox(height: 20), // Space between title/description and button
              _buildStartButton(),
            ] else ...[
              _buildNavigationButtons(),
            ],
          ],
        ),
      ),
    );
  }

  void _setOrientationAndUIConfig() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  // New method for title and description
  Widget _buildTitleAndDescription() {
    return Column(
      children: [
        Text(
          "EcoSphere Explorer",
          style: TextStyle(
            fontFamily: 'Monsterrat', // Specify your custom font
            fontSize: 28, // Adjust the font size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8), // Space between title and description
        Text(
          "Choose your path and see how you effect the enviroment .",
          style: TextStyle(
            fontFamily: 'Monsterrat',
            fontSize: 18, // Adjust the font size
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
Widget _buildStartButton() {
  return ElevatedButton(
    onPressed: () => setState(() => showStartButton = false),
    style: ElevatedButton.styleFrom(
      primary: Colors.blue, // Button color
      onPrimary: Colors.white, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      "Play",
      style: TextStyle(
        fontFamily: 'Monsterrat', // Use your font family
        fontSize: 20, // Adjust the font size
        fontWeight: FontWeight.bold, // Optional
      ),
    ),
  );
}


  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _navigationButton("Urban", 'urban_page'),
        _navigationButton("Rural", 'rural_page'),
      ],
    );
  }

  Widget _navigationButton(String text, String routeName) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, routeName),
      child: Text(text),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(24), // Adjust padding
      ),
    );
  }
}
