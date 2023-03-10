import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(title: "Simple Dialog"));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage( {Key? key, }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BoxFit _boxFit = BoxFit.cover;

  _showBoxFitDiaLog() async{
    BoxFit boxFit = await showDialog(context: context, builder: (BuildContext context){
      return SimpleDialog(
        title: const Text("Select Box Fit"),
        children: [
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.cover);
            },
            child: const Text("Cover"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.contain);
            },
            child: const Text("Contain"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.fill);
            },
            child: const Text("Fill"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.fitHeight);
            },
            child: const Text("Fit Height"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.fitWidth);
            },
            child: const Text("Fit Width"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.scaleDown);
            },
            child: const Text("Scale Down"),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,BoxFit.none);
            },
            child: const Text("None"),
          ),
        ],
      );
    });
    if(boxFit != null){
      setState(() {
        _boxFit = boxFit;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> kittenTiles = [];
    for(int i =200 ; i < 1000 ; i+=100){
      String imageUrl = "http://placekitten.com/200/${i}";
      kittenTiles.add(
          GridTile(child: Image.network(imageUrl, fit: _boxFit)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Dialog: ${_boxFit}"),

      ),
      body: OrientationBuilder(
        builder: (context,orientation){
          return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait)? 2: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            children: kittenTiles,
          );

        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showBoxFitDiaLog,
          child: new Icon(Icons.select_all), )
    );
  }
}

