import 'package:intl/intl.dart';

String getDaysText(int days) {
  return Intl.plural(
    days,
    zero: 'Сразу',
    one: '$days день',
    few: '$days дня',
    many: '$days дней',
    other: '$days дней',
    name: 'days',
    args: [days],
    locale: 'ru'
  );
}

String getPatientsText(int patients) {
  return Intl.plural(
      patients,
      zero: '0 пациентов',
      one: '$patients пациент',
      few: '$patients пациента',
      many: '$patients пациентов',
      other: '$patients пациентов',
      name: 'patients',
      args: [patients],
      locale: 'ru'
  );
}