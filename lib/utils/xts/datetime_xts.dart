import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';
import 'package:tenaid_mobile/utils/xts/status.dart';

import '../pair.dart';

const String DATE_FORMAT = 'EEEE, MMM d, yyyy';
const String SHORT_DATE_FORMAT = 'MMM d, yyyy';
const String DATE_RANGE_FORMAT = 'MMM d, yyyy';
const String DATETIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS";

extension DatetimeXts on DateTime {
  String toFormat(String format) {
    return DateFormat(format).format(this.toLocal());
  }

  String get dateString {
    return '${day} / ${month} / ${year}';
  }

  DateTime withTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String get asDateTimeString {
    TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);
    return '${toFormat(DATE_FORMAT)} - ${timeOfDay.timeString}';
  }

  bool gte(DateTime other) {
    return (isAtSameMomentAs(other) || isAfter(other));
  }

  bool lte(DateTime other) {
    return (isAtSameMomentAs(other) || isBefore(other));
  }
}

extension TimeOfDayXts on TimeOfDay {
  String get timeString {
    String period = hour >= 12 ? 'PM' : 'AM';
    int adjustedHour = hour % 12 == 0 ? 12 : hour % 12;
    String minuteString = minute.toString().padLeft(2, '0');
    return '$adjustedHour:$minuteString $period';
  }
}

extension DatePairXts on Pair<DateTime, DateTime> {
  Status status(BuildContext context) {
    DateTime now = DateTime.now();
    if (now.isBefore(first))
      return Status(color: context.color.secondaryFixed, title: 'Pending');
    else if (now.isAfter(second))
      return Status(color: context.color.error, title: 'Expired');
    else
      return Status(color: context.color.primaryFixed, title: 'Active');
  }

  Pair<DateTime, DateTime> toUtc() {
    return Pair(first: first.toUtc(), second: second.toUtc());
  }
}

Pair<DateTime, DateTime> get today {
  DateTime now = DateTime.now();
  return Pair(
      first: DateTime(now.year, now.month, now.day),
      second: DateTime(now.year, now.month, now.day, 23, 59, 59));
}

Pair<DateTime, DateTime> get recent {
  DateTime now = DateTime.now();
  DateTime startDate = DateTime(now.year, now.month, now.day);

  return Pair(
      first: startDate.subtract(Duration(days: 29)),
      second: startDate.subtract(Duration(days: 1)));
}
