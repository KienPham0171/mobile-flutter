import 'package:intl/intl.dart';
class NumberUtils{

  static String currencyFormat(double value){
      final currencyFormatter =  NumberFormat("#,##0.00", "en_US");
      return currencyFormatter.format(value);
  }
}