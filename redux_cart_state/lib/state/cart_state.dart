import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

import '../actions.dart';
import '../model/item.dart';

class CartState extends Equatable {
  final List<Item> cart;

  CartState({ this.cart = const []});

  @override
  // TODO: implement props
  List<Object?> get props => this.cart;
}
CartState cartReducer(CartState state, dynamic action){
    if(action is AddItemToCartAction){
      var updatedCart = <Item>[];
      updatedCart.addAll(state.cart);
      updatedCart.add(action.item);
      return CartState(cart: updatedCart);
    }
    if(action is RemoveItemFromCartAction){
      var updatedCart = <Item>[];
      updatedCart.addAll(state.cart);
      updatedCart.remove(action.item);
      return CartState(cart: updatedCart);
    }

    return state;
  }
  final store =Store<CartState>(cartReducer, initialState: CartState());
  final items = <Item>[
    Item("1", "Product 1 ", "100"),
    Item("2", "Product 2 ", "100"),
    Item("4", "Product 4 ", "100"),
    Item("3", "Product 3 ", "100"),
    Item("5", "Product 5 ", "100"),
    Item("6", "Product 6 ", "100"),
  ];