import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

class SignHelper {
  static String getSignFromDate(DateTime birthdate) {

    if (birthdate==null) return S.current.com_Unknown;

    List<String> signNames = [
      S.current.dateSign_1,
      S.current.dateSign_2,
      S.current.dateSign_3,
      S.current.dateSign_4,
      S.current.dateSign_5,
      S.current.dateSign_6,
      S.current.dateSign_7,
      S.current.dateSign_8,
      S.current.dateSign_9,
      S.current.dateSign_10,
      S.current.dateSign_11,
      S.current.dateSign_12,
      S.current.dateSign_1
    ];

    List<int> signDays = [0, 22, 20, 21, 21, 22, 23, 23, 23, 23, 23, 22, 22];

    if (birthdate.day < signDays[birthdate.month])
      return signNames[birthdate.month - 1];
    else
      return signNames[birthdate.month];

  }

  static String getYearSignFromDate(DateTime birthdate) {

    if (birthdate==null) return S.current.com_Unknown;

    int year=birthdate.year;

    List<String> signYearNames = [
      S.current.dateChinaSign_1,
      S.current.dateChinaSign_2,
      S.current.dateChinaSign_3,
      S.current.dateChinaSign_4,
      S.current.dateChinaSign_5,
      S.current.dateChinaSign_6,
      S.current.dateChinaSign_7,
      S.current.dateChinaSign_8,
      S.current.dateChinaSign_9,
      S.current.dateChinaSign_10,
      S.current.dateChinaSign_11,
      S.current.dateChinaSign_12
    ];

    for (int i=0;i<12;i++) {
      if ((year-i)%12==0) {
        return signYearNames[i];
      }
    }

    return S.current.com_notFound;

  }
}

class DateHelper {
  static String getMonthName(DateTime date) {
    List<String> months = [
      S.current.dateMonth_Jan,
      S.current.dateMonth_Feb,
      S.current.dateMonth_Mar,
      S.current.dateMonth_Apr,
      S.current.dateMonth_May,
      S.current.dateMonth_Jun,
      S.current.dateMonth_Jul,
      S.current.dateMonth_Aug,
      S.current.dateMonth_Sep,
      S.current.dateMonth_Oct,
      S.current.dateMonth_Nov,
      S.current.dateMonth_Dec
    ];

    return months[date.month-1];
  }
}