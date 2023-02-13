import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horizontal Listview",
      home:  Scaffold(
          appBar: AppBar(
            title: Text("List View Example"),
          ),
          body: Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 1,
              //   crossAxisSpacing: 10,
              //   mainAxisSpacing: 10
              // ),
              children: [
                Container( height:100,width: 260,color: Colors.red,),
                Container( height:100,width: 260,color: Colors.blue,),
                Container( height:100, width: 260,color: Colors.grey,),
                Container( height:100,width: 260,color: Colors.yellow,),
              ],
            ),
          ),
      ),
    );
  }
}

