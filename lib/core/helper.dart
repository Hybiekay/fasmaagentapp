import 'package:intl/intl.dart';

String checkDeliveryDate(String? lastDelivery) {
  if (lastDelivery == null) {
    return "Never";
  }

  String checkDate =
      DateFormat().add_yMEd().format(DateTime.parse(lastDelivery));
  String todayDate = DateFormat().add_yMEd().format(DateTime.now());

  return checkDate == todayDate ? "Today" : checkDate;
}
