import 'package:equatable/equatable.dart';

class Item extends Equatable{
   String id;
   String name;
   String price;

   Item(this.id, this.name, this.price);

  @override
  // TODO: implement props
  List<Object?> get props => [this.id,this.name,this.price];

   @override
  String toString() {
    return 'Item{id: $id, name: $name, price: $price}';
  }
}