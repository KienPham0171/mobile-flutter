import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_cart_state/actions.dart';
import 'package:redux_cart_state/state/cart_state.dart';

import 'model/item.dart';

void main() {
  runApp(StoreProvider<CartState>(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cart ex",
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  ListView createListView(BuildContext context,List<Item> itemList,List<Item> cart){
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context,index){
          Item item = itemList[index];
          return createListItem(item,cart);
    });
  }
  ListTile createListItem(Item item,List<Item> cart){
    print("just one");
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.toString()),
      trailing: Icon(cart.contains(item)?Icons.remove_circle: Icons.add_circle_outline_rounded),
      onTap: (){
        cart.contains(item)?store.dispatch(RemoveItemFromCartAction(item: item)) :
            store.dispatch(AddItemToCartAction(item: item));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    print("rerendering");
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux example"),
      ),
      body: StoreConnector<CartState,List<Item>>(
        converter: (store)=> store.state.cart,
        builder: (context,cart){

          return createListView(context, items, cart);
        },)
    );
  }
}

