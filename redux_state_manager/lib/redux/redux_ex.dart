
import 'package:redux/redux.dart';

class CounterState{
  final int count;
  CounterState({this.count = 0});
}
enum EnumActions{Increment, Decrement}

CounterState counterReducer(CounterState state, dynamic action){
  if(action == EnumActions.Increment){
    return CounterState(count:state.count + 1);
  }
  if(action == EnumActions.Decrement){
    return CounterState(count:state.count -1);
  }
  return state;
}

final store = Store<CounterState>(counterReducer, initialState: CounterState());