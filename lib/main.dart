import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msu_hackathon/rural.dart';
import 'package:msu_hackathon/urban.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
        child: showStartButton ? _buildStartButton() : _buildNavigationButtons(),
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

  Widget _buildStartButton() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () => setState(() => showStartButton = false),
        child: Text("Start"),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _navigationButton("Urban", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrbanPage()),
          );
        }),
        _navigationButton("Rural", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RuralPage()),
          );
        }),
      ],
    );
  }

  Widget _navigationButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        child: Center(child: Text(text)),
        width: 60,
        height: 60,
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
    );
  }
}
