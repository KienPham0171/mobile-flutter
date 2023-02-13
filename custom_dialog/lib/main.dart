import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Dialog",
      home: HOmeWidget(),
      theme: ThemeData.light(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late GridOptions _gridOptions;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CustomDialogWidget extends StatefulWidget {
  GridOptions _gridOptions;
  CustomDialogWidget(this._gridOptions,{Key? key}) : super(key: key);


  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState(GridOptions.copyOf(_gridOptions));
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  _CustomDialogWidgetState(this._gridOptions);
  GridOptions _gridOptions;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Grid Options",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text("Cross Axis Count Portrait"),
                Spacer(),
                DropdownButton<int>(
                  value: _gridOptions._crossAxisCountPortrait,
                    items: [1,2,3,4,5,6].map((e) => DropdownMenuItem(value: e,child: Text(e.toString()),)).toList(),
                    onChanged: (newValue){
                    setState(() {
                      _gridOptions._crossAxisCountPortrait = newValue ?? 1;
                    });
                    }),
                Spacer(),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text("Cros Axis Count Landscape",),
              Spacer(),
              DropdownButton(
                value: _gridOptions._crossAxisCountLandscape,
                  items: [2,3,4,5,6].map((e) => DropdownMenuItem(child: Text(e.toString()),value: e,)).toList(),
                  onChanged: (newValue){
                    setState(() {
                      _gridOptions._crossAxisCountLandscape = newValue??2;
                    });
                  }),
              Spacer()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text("Aspect Ratio"),
              Spacer(),
              DropdownButton(
                  value: _gridOptions._childAspectRatio
                  ,items: [1.0,1.5,2.0,2.5].map((e) => DropdownMenuItem(child: Text(e.toString()),value: e,)).toList(),
                  onChanged: (newValue){
                    setState(() {
                      _gridOptions._childAspectRatio = newValue??_gridOptions._childAspectRatio;
                    });
                  }),
              Spacer(),
            ],
          ),




          ElevatedButton(onPressed: (){
            Navigator.pop(context,_gridOptions);
          }, child: Text("Apply"))
        ],
      ),
    );
  }


}


class HOmeWidget extends StatefulWidget {
  const HOmeWidget({Key? key}) : super(key: key);

  @override
  State<HOmeWidget> createState() => _HOmeWidgetState();
}

class _HOmeWidgetState extends State<HOmeWidget> {
  List<Widget> _kittenTiles = [];
  GridOptions _gridOptions = GridOptions(2,3,1.0,4.0,4.0);

  @override
  void initState() {
    String imageUrl = "http://placekitten.com/200/";
    for(int i = 200; i<1000 ; i+=100){
      _kittenTiles.add(
        GridTile(
          header: const GridTileBar(
            title: Text("Cats",style: TextStyle(fontWeight:FontWeight.bold)), backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),),
          footer: const GridTileBar(
              title: Text("How cute", textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          child: Image.network(imageUrl+i.toString(),fit: BoxFit.cover,),
          ),

      );
    }
  }

  void _showGridOptionsDiaLog() async{
    GridOptions gridOptions = await showDialog(context: context, builder: (BuildContext context){
      return Dialog(child: CustomDialogWidget(this._gridOptions),);
    });
    if(_gridOptions != null){
      setState(() {
        _gridOptions = gridOptions;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
            crossAxisCount: (orientation == Orientation.portrait)
                ? _gridOptions._crossAxisCountPortrait
                : _gridOptions._crossAxisCountLandscape,
            childAspectRatio: _gridOptions._childAspectRatio,
            padding: EdgeInsets.all(_gridOptions._padding),
            mainAxisSpacing: _gridOptions._spacing,
            crossAxisSpacing: _gridOptions._spacing,
            children: _kittenTiles);
      }),
      bottomNavigationBar: Container(
          child: Text(_gridOptions.toString()), padding: EdgeInsets.all(20.0)),
      floatingActionButton: FloatingActionButton(
        onPressed: _showGridOptionsDiaLog,
        tooltip: 'Try more gridoptions',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build
    );
  }

}



class GridOptions{
  int _crossAxisCountPortrait;
  int _crossAxisCountLandscape;
  double _childAspectRatio;
  double _padding;
  double _spacing;
  GridOptions(this._crossAxisCountPortrait,
      this._crossAxisCountLandscape, this._childAspectRatio,
      this._padding, this._spacing);

  static GridOptions copyOf(GridOptions gridOptions) {
    return GridOptions(gridOptions._crossAxisCountPortrait,
    gridOptions._crossAxisCountLandscape,gridOptions._childAspectRatio,gridOptions._padding,gridOptions._spacing);
  }

  @override
  String toString() {
    return 'GridOptions{_crossAxisCountPortrait: $_crossAxisCountPortrait,'
        ' _crossAxisCountLandscape: $_crossAxisCountLandscape,'
        ' _childAspectRatio: $_childAspectRatio, _padding: $_padding,'
        ' _spacing: $_spacing}';
  }
}


