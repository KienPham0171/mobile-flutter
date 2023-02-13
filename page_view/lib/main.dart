import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "page view",
      home: MyHomePage(),
    );
  }
}

class Order {
  DateTime _dt;
  String _description;
  double _total;

  Order(this._dt,this._description,this._total);
  DateTime get dt=> _dt;
  String get description => _description;
  double get total => _total;
}
class Customer{
  String _name;
  String _location;
  List<Order> _orders;
  Customer(this._name, this._location, this._orders);

  List<Order> get orders => _orders;

  set orders(List<Order> value) {
    _orders = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  PageController pageController = PageController(initialPage: 0);
  final Duration duration = Duration(seconds: 1);
  final Curve curve = Curves.easeInSine;

  final List<Customer> customerList= [
  Customer("Bike Corp", "Atlanta", [
  Order(DateTime(2018, 11, 17), "Bicycle parts", 197.02),
  Order(DateTime(2018, 12, 1), "Bicycle parts", 107.45), ]),
  Customer("Trust Corp", "Atlanta", [
  Order(DateTime(2017, 1, 3), "Shredder parts", 97.02),
  Order(DateTime(2018, 3, 13), "Shredder blade", 7.45),
  Order(DateTime(2018, 5, 2), "Shredder blade", 7.45), ]),
  Customer("Jilly Boutique", "Birmingham", [
  Order(DateTime(2018, 1, 3), "Display unit", 97.01),
  Order(DateTime(2018, 3, 3), "Desk unit", 12.25),
  Order(DateTime(2018, 3, 21), "Clothes rack", 97.15), ]),
  ];

  Widget pageViewItemBuilder (BuildContext context, int index){
    if(index == 0){
      return createHomePage(context);
    }else{
      return createDetailPage(context,index);
    }
  }

  Widget createHomePage(BuildContext context){
    List<Widget> widgetsList = [];
    widgetsList.add(
      Padding(
          padding: EdgeInsets.all(20),
          child: Text("Customer List",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),
          textAlign: TextAlign.center,),
      ),
    );

    for(int i = 0, ii = customerList.length; i< ii ; i++){
      Customer customer = customerList[i];
      widgetsList.add(
        createHomePageListItem(context,customer,i)
      );
    }
    return ListView(children: widgetsList,);
  }

  ListTile createHomePageListItem(BuildContext context,Customer customer, int index){
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.location),
      trailing: Icon(Icons.arrow_right),
      onTap: (){
        pageController.animateToPage(index+1, duration: duration, curve: curve);
      },
    );
  }


  Widget createDetailPage(BuildContext context,int index){
    Customer customer = customerList[index -1];
    List<Widget> widgetsList = List.from(customer.orders.map((order) => createOrderListWidget(context,customer,order)));
    widgetsList.insert(
      0,
      Container(
        child: Column(
          children: [
            Text(customer.name,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
            Text(
              customer.location,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "${customer.orders.length} Orders", style: TextStyle(fontSize:
            20.0, fontWeight: FontWeight.bold), ),
            Padding(padding: EdgeInsets.all(20.0)),
          ],
        ),
        padding: EdgeInsets.all(20),
      )
    );
    return ListView(children: widgetsList,);
  }

  ListTile createOrderListWidget(
      BuildContext context, Customer customer, Order order) {
    return new ListTile(
        title: Text(order.description),
        subtitle:
        Text("${order.dt.month}/${order.dt.day}/${order.dt.year}: "
            "\$${order.total}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(onPressed: (){
            pageController.animateToPage(0, duration: duration, curve: curve);
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: PageView.builder(itemBuilder: pageViewItemBuilder,itemCount: customerList.length+1,controller: pageController,),
      ),
    );
  }
}


