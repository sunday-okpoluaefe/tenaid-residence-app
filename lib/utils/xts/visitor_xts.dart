import 'package:flutter/material.dart';
import 'package:tenaid_mobile/library/community/data/model/visitor.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/pair.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';

enum InviteState { expired, pending, checkedIn, checkedOut, active, upcoming }

extension VisitorXts on VisitorDomain {
  String get dateTime {
    DateTime startDate = DateTime.parse(start!).toLocal();
    DateTime endDate = DateTime.parse(end!).toLocal();
    if (endDate.difference(startDate).inDays > 0) {
      return '${startDate.toFormat(DATE_RANGE_FORMAT)} - ${endDate.toFormat(DATE_RANGE_FORMAT)}';
    } else {
      TimeOfDay startTime =
          TimeOfDay(hour: startDate.hour, minute: startDate.minute);
      TimeOfDay endTime = TimeOfDay(hour: endDate.hour, minute: endDate.minute);
      return '${startDate.toFormat(SHORT_DATE_FORMAT)} | ${startTime.timeString} - ${endTime.timeString}';
    }
  }
}

extension VisitorListExt on List<Visitor> {
  List<Visitor> visitorsByDate({required Pair<DateTime, DateTime> dates}) {
    return where((visitor) =>
        (visitor.startDate.gte(dates.first) &&
            visitor.startDate.lte(dates.second)) ||
        (visitor.startDate.isBefore(dates.first) &&
            visitor.endDate.gte(dates.second))).toList();
  }

  PaginatedResult paged({int page = 1, int limit = 10}) {
    List<Visitor> items = [];
    if (page < 1) page = 1;

    int startIndex = (page - 1) * limit;

    if (startIndex < length) {
      int endIndex = startIndex + limit;
      items = this.sublist(startIndex, endIndex > length ? length : endIndex);
    }

    return PaginatedResult(
        data: items,
        currentPage: page,
        totalItems: items.length,
        totalPages: (items.length / limit).ceil(),
        itemsPerPage: length);
  }

  List<Visitor> todayVisitors() => visitorsByDate(dates: today);

  List<Visitor> recentVisitors() => visitorsByDate(dates: recent);

  List<Visitor> upcomingVisitors() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day, 23, 59, 59);

    return where((visitor) => (visitor.startDate.gte(date))).toList();
  }
}
