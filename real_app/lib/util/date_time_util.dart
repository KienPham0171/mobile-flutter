import 'package:intl/intl.dart';

class DateTimeUtils{
  static String dateTimeToString(DateTime date){
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}