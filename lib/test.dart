import 'package:flutter/material.dart';



class DragPage extends StatefulWidget {
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  List<Map<String, dynamic>> objects = []; // List to store objects and their positions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Object Placement"),
      ),
      drawer: AppDrawer(
        onItemSelected: (String selected) {
          setState(() {
            // Add a new object to the list with its initial position
            objects.add({
              'type': selected,
              'position': Offset(200.0, 200.0),
            });
          });
        },
      ),
      body: GestureDetector(
        onTapDown: (details) {
          // Check if any object is tapped
          for (int i = objects.length - 1; i >= 0; i--) {
            Map<String, dynamic> object = objects[i];
            Rect objectRect = Rect.fromCenter(
              center: object['position'],
              width: 50.0,
              height: 50.0,
            );

            if (objectRect.contains(details.globalPosition)) {
              setState(() {
                // Move the tapped object to the top of the list
                objects.removeAt(i);
                objects.add(object);
              });
              break;
            }
          }
        },
        onPanUpdate: (details) {
          setState(() {
            // Update the position of the topmost object
            if (objects.isNotEmpty) {
              objects.last['position'] += details.delta;
            }
          });
        },
        child: Stack(
          children: [
            // Background photo
            Image.asset(
              'lib/bin/farm_field.jpg', // Replace with your image asset path
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // Draggable objects
            for (var object in objects)
              Positioned(
                left: object['position'].dx - 25.0,
                top: object['position'].dy - 25.0,
                child: Draggable(
                  child: ObjectWidget(object['type']),
                  feedback: ObjectWidget(object['type']),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (_, __) {},
                  data: object['type'],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(String) onItemSelected;

  AppDrawer({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Object 1"),
            onTap: () => onItemSelected("object1"),
          ),
          ListTile(
            title: Text("Object 2"),
            onTap: () => onItemSelected("object2"),
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}

class ObjectWidget extends StatelessWidget {
  final String objectType;

  ObjectWidget(this.objectType);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: objectType == 'object1' ? Colors.red : Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(objectType),
      ),
    );
  }
}
