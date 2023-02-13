import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigator named route with param",
      theme: ThemeData(primarySwatch: Colors.green),
      // home: MyHomePage(),
      home: DataContainerWidget(child: MyHomePage()),
    );
  }
}
class Product {
  int _productId;
  String _productName;
  double _productDetail;
  String _productDes;

  Product(this._productId, this._productName, this._productDetail,
      this._productDes);
  int get productId => _productId;

  String get productDes => _productDes;

  set productDes(String value) {
    _productDes = value;
  }

  double get productDetail => _productDetail;

  set productDetail(double value) {
    _productDetail = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  @override
  String toString() {
    return 'Product{_productId: $_productId, _productName: $_productName, _productDetail: $_productDetail, _productDes: $_productDes}';
  }
}

class DataContainerWidget extends InheritedWidget{
  DataContainerWidget({super.key, required super.child});

  List<Product> _products = [
    Product(1, "Spring boot in action",12.0, "a book of kinepham"),
    Product(2, "Spring security in action",12.0, "another book of kinepham"),
  ];

  Product getProductById(int id){
    return _products.firstWhere((e) => e.productId == id);
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
  static DataContainerWidget of(BuildContext context){
    // return context.dependOnInheritedWidgetOfExactType(aspect: DataContainerWidget) as DataContainerWidget;
    return context.dependOnInheritedWidgetOfExactType(aspect: DataContainerWidget) as DataContainerWidget;
  }

}


class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Product> _products = [];
  PageController controller = PageController(initialPage: 0);

  void navigateToProduct(BuildContext context, Product product){
    print("tap");
    Navigator.pushNamed(context, '/products/:${product._productId}');
  }

  ListTile createProductWidget(context,Product product){
    return  ListTile(
      title: Text(product.productName),
      subtitle: Text(product.productDes),
      onTap: () => navigateToProduct(context,product),
      trailing:const Icon(Icons.arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    DataContainerWidget? container = DataContainerWidget.of(context);
    ListView child = ListView.builder(
        itemCount: container._products.length,
        itemBuilder: (context,index){
          return createProductWidget(context, container._products[index]);
        },
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator with params"),
      ),
      body: Center(
        child: child,
      ),
    );
  }
}


