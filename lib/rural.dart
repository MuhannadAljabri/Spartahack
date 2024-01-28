import 'package:flutter/material.dart';

class RuralPage extends StatefulWidget {
  @override
  _RuralPageState createState() => _RuralPageState();
}

class _RuralPageState extends State<RuralPage> {
  String? selectedItemPath; // Variable to hold the selected item path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0, // Optional: Removes the shadow under the AppBar
  );
}



  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem('lib/bin/cows.png', 'Cow'),
          _buildDrawerItem('assets/landscape.png', 'Item 2'),
          // Add more list items as needed
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: Text('Select Items', style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }

  ListTile _buildDrawerItem(String imagePath, String text) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
      ),
      title: Text(text),
      onTap: () {
        setState(() {
          selectedItemPath = imagePath;
        });
        Navigator.pop(context);
      },
    );
  }

Container _buildBody() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('lib/bin/farm_field.jpg'), // Background image
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: selectedItemPath != null
          ? Container(
              width: 100, // Width of the container
              height: 100, // Height of the container
              child: Image.asset(
                selectedItemPath!,
                fit: BoxFit.contain, // Keeps image aspect ratio
              ),
            )
          : Text( "", // Text displayed when no item is selected
 style: TextStyle(fontSize: 24, color: Colors.white),
            ),
    ),
  );
}


  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(Icons.home),
      tooltip: 'Go back to home',
    );
  }
}
