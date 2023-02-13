import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  String computeListOfTimestamps(int count){
    StringBuffer sb = StringBuffer();
    for(int i=0; i< count; i++){
      sb.writeln("${i+1} : ${DateTime.now()}");
    }
    return sb.toString();
  }

  Future<String> createFutureCalculation(int count){
    return Future(() => computeListOfTimestamps(count));
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showCalculation = false;
  void _onInvokeFuturePressed(){
    setState(() {
      _showCalculation = !_showCalculation;
    });
  }
  
  @override
  Widget build(BuildContext context)  {
    Widget child = _showCalculation
        ? FutureBuilder(
        future: widget.createFutureCalculation(10000),
        builder:
            (BuildContext context, AsyncSnapshot snapshot) {
                  return Expanded(
                             child: SingleChildScrollView(
                                    child: Text(
                                    '${snapshot.data == null ? "doi chut" : snapshot.data}',
                                        style: TextStyle(fontSize: 20.0))));})
        : Text('hit the button to show calculation');
    return Scaffold(
      appBar: AppBar(
        title:  Text("Future"),),
      body:  Center(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center, children:
          <Widget>[child])),
      floatingActionButton: FloatingActionButton(
        onPressed: _onInvokeFuturePressed, tooltip: 'Invoke Future',
        child: Icon(Icons.refresh),), // This trailing comma makes auto-formatting nicer for build
    );
  }
}


