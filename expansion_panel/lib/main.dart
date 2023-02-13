import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class ExpansionPanelData{
  String _title;
  String _body;
  bool _expanded;

  ExpansionPanelData(this._title, this._body, this._expanded);

  bool get expanded => _expanded;

  set expanded(bool value) {
    _expanded = value;
  }

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'ExpansionPanelData{_title: $_title, _body: $_body, _expanded: $_expanded}';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomeWidget(),
      // showPerformanceOverlay: true,
    );
  }
}


class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late final List<ExpansionPanelData> _expansionPanelData;
  // List<ExpansionPanelData> _expansionPanelData;

  @override
  initState() {
    super.initState();
    _expansionPanelData =[
      ExpansionPanelData("Can I backup my Data", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("Do something", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("What the fuck", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("Where is your love?", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("Are you stupid?", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("What do you do", "adfd asdfdsf sdfdsf fadsf", false),
      ExpansionPanelData("Bring it up", "adfd asdfdsf sdfdsf fadsf", false),
    ];
  }


  _onExpansion(int panelIndex, bool isExpanded){
    setState(() {
      print(isExpanded);
      _expansionPanelData[panelIndex].expanded = !isExpanded;
    });
  }
  _deleteItem(ExpansionPanelData deletedItem){
    setState(() {
      List<ExpansionPanelData> newList = [];
      for(int i =0 ; i< _expansionPanelData.length ; i++){
        if(_expansionPanelData[i] != deletedItem){
          newList.add(_expansionPanelData[i]);
        }
      }
      _expansionPanelData.removeWhere((element) => true);
      _expansionPanelData.addAll(newList);
      // _expansionPanelData = newList;
    });
  }
  _reverseData(){
    setState(() {
      print("reverse");
      _expansionPanelData.removeWhere((element) => true);
      _expansionPanelData.addAll([
        ExpansionPanelData("Can I backup my Data", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("Do something", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("What the fuck", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("Where is your love?", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("Are you stupid?", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("What do you do", "adfd asdfdsf sdfdsf fadsf", false),
        ExpansionPanelData("Bring it up", "adfd asdfdsf sdfdsf fadsf", false),
      ]);
    });


  }

  @override
  Widget build(BuildContext context) {
    List<ExpansionPanel> expansionPanels = [];
    for (int i = 0, ii =
        _expansionPanelData.length; i < ii; i++) {
      var expansionPanelData = _expansionPanelData[i];
      expansionPanels.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(expansionPanelData.title, style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold))); },
          body: Padding(
                   padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(expansionPanelData.body,
                              style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
                        ElevatedButton(onPressed: (){
                            _deleteItem(expansionPanelData);
                        }, child: Text("Xoa")),
                      ],
                    ),
                  )
                  ),
                  // child:
                  // Text(expansionPanelData.body,
                  //         style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic))),
          isExpanded: expansionPanelData.expanded)); }
    return Scaffold(
        appBar: AppBar(
          title: Text("FAQs"), ),
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24.0),
              child: ExpansionPanelList(
                children: expansionPanels, expansionCallback: _onExpansion),
            )),
        floatingActionButton: FloatingActionButton(
            child:Icon(Icons.healing),
            onPressed: (){
                _reverseData();
            },
          tooltip: "Reverse data",
        ),
    );
  }
}

/*class ExpansionPanelData {String _title;
String _body;
bool _expanded;
ExpansionPanelData(this._title, this._body, this._expanded);
String get title => _title;
@override
String toString() {
  return 'ExpansionPanelData{_title: $_title, _body: $_body,_expanded: $_expanded}'; }
String get body => _body;
bool get expanded => _expanded;
set expanded(bool value) {
  _expanded = value;
}
}
class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,),
        home: new HomeWidget());
  }
}
class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => new _HomeWidgetState([
    ExpansionPanelData(
        "Can I backup my data?", "dsfuysdiu fudsy fiusdyf "
        "usdyf iudsyf udsyfiuysd ufyuisdyfi sduiyfiusdyf dsyui u",
        false),
    ExpansionPanelData(
        "How can I increase my space?", "sydufy "
        "dsuiyfuidysu fusyufsdyuif ysudiy fuydsufy suyf udsy fu",
        false),
    ExpansionPanelData(
        "How do I cancel?",
        "ddsufysd yfds fsduyf sdyf "
            "sudyuy fsudyf sydyf dsy fdsuyf udsufy udsyfdsfyuysdf uyud",
        false),
    ExpansionPanelData(
        "How do I change language?", "udsuf sdifuu fdsuif "
        "uf dsufdisu fius wewqw qeqweqwyiquuiqweqwewqe weewewewe", false),
        ExpansionPanelData(
        "How do I search?",
        "ooioio ioi oio i odsfudsifsdf"
            " dfdsfdsui idufu dsiuf isduf iduf idsu fisduf iusidf ", false),ExpansionPanelData(
        "How do I view on other devices?", "idusdf isu "
        "idsu idsu fisduf usyfuedy ewuyduyed uyeu dyeudy uweyu",
        false),
    ExpansionPanelData(
        "How do I view my history", "iirewy syfudy fu "
        "yfsduyfds yfdsuyf udsfydsufy sduyf dsuyf udsyf udsyuee",
        false),
    ExpansionPanelData(
        "Is my subscription cost going to go up?", "wieureiy dys udsyyf"
    "dsufy dusyfudsy fuysdu udsyuyfudsyfuewyrwreooioou uiy",
        false),
  ]);
}
class _HomeWidgetState extends State<HomeWidget> {
// Track expansion panels, including expanded true/false;
  List<ExpansionPanelData> _expansionPanelData;
  _HomeWidgetState(this._expansionPanelData);
  _onExpansion(int panelIndex, bool isExpanded) {
// Toggle the expanded state. Using setState will force 'build' tofire.
    setState(() {
      _expansionPanelData[panelIndex].expanded =
      !(_expansionPanelData[panelIndex].expanded); });
  }
  @override
  Widget build(BuildContext context) {
// Build the expansion panels from scratch every time the ui builds.
// This is not as expensive as it sounds.
    List<ExpansionPanel> expansionPanels = []; for (int i = 0, ii =
        _expansionPanelData.length; i < ii; i++) {
      var expansionPanelData = _expansionPanelData[i];
      expansionPanels.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(expansionPanelData.title, style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold))); },
          body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(expansionPanelData.body, style:
              TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic))),
          isExpanded: expansionPanelData.expanded)); }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("FAQs"), ),
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24.0), child: new
            ExpansionPanelList(
                children: expansionPanels, expansionCallback: _onExpansion),
            )));
  }
}*/





