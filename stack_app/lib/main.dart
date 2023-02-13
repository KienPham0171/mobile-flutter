import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final PleaseWaitWidget _pleaseWaitWidget = PleaseWaitWidget();
  final AppWidget _appWidget = AppWidget();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _pleaseWait = false;

  void _togglePleaseWait(){
    setState(() {
      _pleaseWait = !_pleaseWait;
    });
  }
  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> childWidgets = _pleaseWait?[widget._pleaseWaitWidget,widget._appWidget]:[widget._appWidget];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: childWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePleaseWait,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const[
          Text('Your', style: TextStyle(fontSize: 20.0)),
          Text('App', style: TextStyle(fontSize: 20.0)),
          Text('Goes',
              style: TextStyle(fontSize: 20.0)),
          Text('Here', style:
          TextStyle(fontSize: 20.0))
        ],
      )
    );
  }
}
class PleaseWaitWidget extends StatelessWidget {
  const PleaseWaitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(strokeWidth: 8.0,color: Colors.grey.withOpacity(0.3),),
      )
    );
  }
}


