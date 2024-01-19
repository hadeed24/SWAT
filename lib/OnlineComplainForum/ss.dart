
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create an instance of your controller
  final MyController myController = MyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Controller Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                // Access the controller's properties
                myController.text,
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  // Modify the controller's state
                  myController.text = "Updated Text!";
                },
                child: Text('Update Text'),
              ),
            ],
          ),
        ),
      
    );
  }
}
// controller.dart

class MyController {
  // Your controller logic goes here
  String text = "Hello from Controller!";
}
