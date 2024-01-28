import 'package:flutter/material.dart';

class RuralPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Rural Page'),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(
            icon: Icons.nature,
            text: 'Item 1',
            onTap: () => _onDrawerItemTapped(context),
          ),
          _buildDrawerItem(
            icon: Icons.landscape,
            text: 'Item 2',
            onTap: () => _onDrawerItemTapped(context),
          ),
          // Add more list items as needed
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(
        'Menu',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  ListTile _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _onDrawerItemTapped(BuildContext context) {
    // Update the state of the app
    // ...
    // Then close the drawer
    Navigator.pop(context);
  }

  Container _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/bin/farm_field.jpg'), // Replace with your image asset path
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context); // Navigate back to the previous screen
      },
      child: Icon(Icons.home), // Icon for the button
      tooltip: 'Go back to home', // Tooltip text on long press
    );
  }
}
