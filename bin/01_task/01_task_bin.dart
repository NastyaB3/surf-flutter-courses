import 'package:surf_dart_courses_template/01_task/01_task.dart';

enum Countries { brazil, russia, turkish, spain, japan }

void main() {
  int currentYear = DateTime.now().year;
  final mapBefore2010 = <Countries, List<Territory>>{
    Countries.brazil: [
      Territory(
        34,
        ['Кукуруза'],
        [
          AgriculturalMachinery(
            'Трактор Степан',
            DateTime(2001),
          ),
          AgriculturalMachinery(
            'Культиватор Сережа',
            DateTime(2007),
          ),
        ],
      ),
    ],
    Countries.russia: [
      Territory(
        14,
        ['Картофель'],
        [
          AgriculturalMachinery(
            'Трактор Гена',
            DateTime(1993),
          ),
          AgriculturalMachinery(
            'Гранулятор Антон',
            DateTime(2009),
          ),
        ],
      ),
      Territory(
        19,
        ['Лук'],
        [
          AgriculturalMachinery(
            'Трактор Гена',
            DateTime(1993),
          ),
          AgriculturalMachinery(
            'Дробилка Маша',
            DateTime(1990),
          ),
        ],
      ),
    ],
    Countries.turkish: [
      Territory(
        43,
        ['Хмель'],
        [
          AgriculturalMachinery(
            'Комбаин Василий',
            DateTime(1998),
          ),
          AgriculturalMachinery(
            'Сепаратор Марк',
            DateTime(2005),
          ),
        ],
      ),
    ],
  };

  final mapAfter2010 = {
    Countries.turkish: [
      Territory(
        22,
        ['Чай'],
        [
          AgriculturalMachinery(
            'Каток Кирилл',
            DateTime(2018),
          ),
          AgriculturalMachinery(
            'Комбаин Василий',
            DateTime(1998),
          ),
        ],
      ),
    ],
    Countries.japan: [
      Territory(
        3,
        ['Рис'],
        [
          AgriculturalMachinery(
            'Гидравлический молот Лена',
            DateTime(2014),
          ),
        ],
      ),
    ],
    Countries.spain: [
      Territory(
        29,
        ['Арбузы'],
        [
          AgriculturalMachinery(
            'Мини-погрузчик Максим',
            DateTime(2011),
          ),
        ],
      ),
      Territory(
        11,
        ['Табак'],
        [
          AgriculturalMachinery(
            'Окучник Саша',
            DateTime(2010),
          ),
        ],
      ),
    ],
  };

  final List<AgriculturalMachinery> machineries = [
    ...mapBefore2010.values,
    ...mapAfter2010.values
  ]
      .expand((element) => element)
      .map((e) => e.machineries)
      .expand((element) => element)
      .toList();
  final List<DateTime> releaseDate =
      machineries.map((e) => e.releaseDate).toList();
  final Set<DateTime> uniqueReleaseDate = Set.from(releaseDate);
  List<DateTime> sortedUniqueDates = uniqueReleaseDate.toList();
  sortedUniqueDates.sort();
  int totalAge = 0;
  for (var date in sortedUniqueDates) {
    totalAge += currentYear - date.year;
  }
  double averageAge = totalAge / sortedUniqueDates.length;
  print('Average age of machineries: ${averageAge.toStringAsFixed(2)} years');

  int halfIndex = (sortedUniqueDates.length / 2).ceil();
  List<DateTime> oldestDates = sortedUniqueDates.sublist(0, halfIndex);
  int totalOldestAge = 0;
  for (var date in oldestDates) {
    totalOldestAge += currentYear - date.year;
  }
  double averageOldestAge = totalOldestAge / halfIndex;
  print(
      'Average age of oldest machineries: ${averageOldestAge.toStringAsFixed(2)} years');

}
