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
        child: showStartButton ? _buildStartButton() : _buildNavigationButtons(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setOrientationAndUIConfig();
  }

  @override
  void dispose() {
    // Reset orientation on dispose, if needed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _setOrientationAndUIConfig() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      child: Text("Play"),
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
