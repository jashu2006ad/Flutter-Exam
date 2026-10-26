import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("Layout Structures")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Text("Row Layout", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.person, size: 40, color: Colors.red),
                  Icon(Icons.star, size: 40, color: Colors.green),
                  Icon(Icons.star, size: 40, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20),
              Text("Column Layout", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
              Column(children: [
                Container(height: 50, width: double.infinity,
                    color: Colors.orange,
                    child: Center(child: Text("Top Container"))),
                SizedBox(height: 10),
                Container(height: 50, width: double.infinity,
                    color: Colors.teal,
                    child: Center(child: Text("Middle Container"))),
                SizedBox(height: 10),
                Container(height: 50, width: double.infinity,
                    color: Colors.purple,
                    child: Center(child: Text("Bottom Container"))),
              ]),
              SizedBox(height: 20),
              Text("Stack Layout", style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
              Container(height: 200, width: 200,
                color: Colors.grey[300],
                child: Stack(children: [
                  Container(height: 200, width: 200,
                      color: Colors.blue),
                  Positioned(top: 30, left: 30,
                    child: Container(height: 100, width: 100,
                        color: Colors.red)),
                  Positioned(top: 60, left: 60,
                    child: Container(height: 50, width: 50,
                        color: Colors.yellow)),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}