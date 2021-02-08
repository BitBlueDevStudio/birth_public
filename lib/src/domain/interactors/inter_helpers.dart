import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

class SignHelper {
  static String getSignFromDate(DateTime birthdate) {

    if (birthdate==null) return S.current.com_Unknown;

    List<String> signNames = [
      "Козерог",
      "Водолей",
      "Рыбы",
      "Овен",
      "Телец",
      "Близнецы",
      "Рак",
      "Лео",
      "Дева",
      "Весы",
      "Скорпион",
      "Стрелец",
      "Козерог"
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
      "Обезьяна",
      "Петух",
      "Собака",
      "Свинья",
      "Крыса",
      "Буль",
      "Тигр",
      "Кролик",
      "Дракон",
      "Змея",
      "Лошадь",
      "Козел"
    ];

    for (int i=0;i<12;i++) {
      if ((year-i)%12==0) {
        return signYearNames[i];
      }
    }

    return "not found";

  }
}

class DateHelper {
  static String getMonthName(DateTime date) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return months[date.month];
  }
}