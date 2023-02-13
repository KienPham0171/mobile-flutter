import 'dart:io';

import 'package:flutter/foundation.dart';
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
      title: "Listview Builder",
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<dynamic> _nasaOffices = [
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
    {
      "Name": "Mach 6, High Reynolds Number Facility", "Address": "1864 4th St", "City": "Wright-Patterson AFB", "State": "OH", "ZIP": "45433-7541", "Country": "US"
    },
    {
      "Name": "N206A - 12 FOOT PRESSURE WIND TUNNELAUXILIARIES (PAPAC)", "Address": "Code RC", "City":"Moffett Field", "State": "CA", "ZIP": "94035", "Country": "US"
    },
  ];

  @override
  Widget build(BuildContext context) {
    ListView builder = ListView.builder(
      itemCount: _nasaOffices.length,
        itemBuilder: (context, index) {
          if (kDebugMode) {
            print("invoking itemBuilder for row ${index} ");
          }
          // sleep(Duration(seconds:0.3));
          var nasaOffice = _nasaOffices[index];
          return ListTile(
            title: Text("${nasaOffice["Name"]}"),
            subtitle: Text('${nasaOffice['Address']}, ${nasaOffice['City']},'
                '${nasaOffice['State']}, ${nasaOffice['ZIP']},'
                '${nasaOffice['Country']}'),
            trailing: Icon(Icons.arrow_right),
          );
          // return Container();
        });
    return Scaffold(
      appBar: AppBar(
        title: Text("Nasa offices"),
      ),
        body: Center(child: builder,)
    );
  }
}



















String removeDiacritics(String text) =>
    new String.fromCharCodes(replaceCodeUnits(text.codeUnits));

bool _initialized = false;
Map<int, int> _singleUnit = {};
Map<int, List<int>> _multiUnit = {};

void _register(String base, String accents) {
  if (base.codeUnits.length == 1) {
    final int baseUnit = base.codeUnits.first;
    for (int unit in accents.codeUnits) {
      _singleUnit[unit] = baseUnit;
    }
  } else {
    for (int unit in accents.codeUnits) {
      _multiUnit[unit] = base.codeUnits;
    }
  }
}

