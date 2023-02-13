import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form control",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

class PersonInfo {
  String fname = "";
  String lname = "";
  String sex = "m";
  String addr1 = "";
  String addr2 = "";
  String city = "";
  String state = "";
  String zip = "";
  bool fiveYears = false;
  DateTime dob = DateTime.now();

  PersonInfo(this.fname,this.lname,this.sex,this.addr1,this.addr2,
      this.city,this.state,this.zip,this.fiveYears,this.dob);

  @override
  String toString() {
    return 'PersonInfo{fname: $fname, lname: $lname, sex: $sex, addr1: $addr1,'
        ' addr2: $addr2, city: $city, state: $state, zip: $zip, fiveYears: $fiveYears, dob: $dob}';
  }
  // static PersonInfo empty() => this;
  PersonInfo.empty();
}


class MyHomePage extends StatefulWidget {
  PersonInfo address = PersonInfo.empty();

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void onSaved (PersonInfo address){
    showDialog<bool>(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Address"),
        content: Text(address.toString(),),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context,true);
          }, child: Text("Close")),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form validation"),

      ),
      body: Center(
        child: ListView(
          children: [AddressWidget(address: widget.address,onSaved: onSaved)],
        ),
      ),
    );
  }
}

class AddressWidget extends StatefulWidget {
  final PersonInfo address;
  final ValueChanged<PersonInfo> onSaved;

  AddressWidget({Key? key, required this.address, required this.onSaved,}) : super(key: key);


  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {

  static const STATE_DROPDOWN_MENU_ITEMS = [
    DropdownMenuItem(value: "AL", child: const Text("Alabama")),
    DropdownMenuItem(value: "AK", child: const Text("Alaska")),
    DropdownMenuItem(value: "AZ", child: const Text("Arizona")),
    DropdownMenuItem(value: "FL", child: const Text("Florida")),
    DropdownMenuItem(value: "GA", child: const Text("Georgia")),
    DropdownMenuItem(value: "HI", child: const Text("Hawaii")),
    DropdownMenuItem(value: "ID", child: const Text("Idaho")),
    DropdownMenuItem(value: "IL", child: const Text("Illinois")),
    DropdownMenuItem(value: "IN", child: const Text("Indiana")),
    DropdownMenuItem(value: "IA", child: const Text("Iowa")),
    DropdownMenuItem(value: "KS", child: const Text("Kansas")),
    DropdownMenuItem(value: "KY", child: const Text("Kentucky")),
    DropdownMenuItem(value: "RI", child: const Text("RhodeIsland")),
    DropdownMenuItem(value: "SC", child: const Text("South Carolina")),
    DropdownMenuItem(value: "SD", child: const Text("South Dakota")),
   ];

  @override
  Widget build(BuildContext context) {


    return const Placeholder();
  }
}

