import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static final _dateFormat = DateFormat.yMMMd();
  static final _dateStringFormat = DateFormat('dd-MM-yyyy');
  static final _dateTimeFormat = DateFormat('dd-MM-yyyy hh:mma');
  static final _timeFormat = DateFormat('hh:mma');
  static final now = DateTime.now();

  String get folded {
    padded(int val) => val.toString().padLeft(2, '0');
    return '${padded(day)}-${padded(month)}-$year';
  }

  String get formatted {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    if (isBefore(today)) return _dateStringFormat.format(this);
    return _timeFormat.format(toLocal());
  }

  String get formatDate {

    return _dateFormat.format(this);
  }

  String get formatDateTime {

    return _dateTimeFormat.format(this);
  }

  String get toDateString {

    return _dateStringFormat.format(this);
  }
  String get formattedTime{

    return _timeFormat.format(this);
  }

  String getWeekDay() {
    switch (weekday) {
      case 1:
        return 'MONDAY';
      case 2:
        return 'TUESDAY';
      case 3:
        return 'WEDNESDAY';
      case 4:
        return 'THURSDAY';
      case 5:
        return 'FRIDAY';
      case 6:
        return 'SATURDAY';
      case 7:
        return 'SUNDAY';
      default:
        return 'Error';
    }

/*   String timeAgo({DateTime? other, bool numericDates = true}) {
    final difference = (other ?? DateTime.now()).difference(this);
    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
 */
  }
}