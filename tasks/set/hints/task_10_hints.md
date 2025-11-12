# Подсказки к Задаче 10: Анализ посещаемости курсов

## Подсказка 1: Структура данных Map<String, Set<String>>
Используйте Map для хранения курсов и студентов:
```dart
Map<String, Set<String>> courseAttendance = {
  'Dart': {'Иван', 'Мария', 'Петр'},
  'Flutter': {'Иван', 'Мария', 'Катя'},
  'Firebase': {'Мария', 'Анна'}
};
```

## Подсказка 2: Студенты, посетившие все курсы
Используйте `reduce()` с `intersection()` для нахождения общих студентов:
```dart
// Начинаем с первого курса
var allCourses = courseAttendance.values.reduce((a, b) => a.intersection(b));

if (allCourses.isEmpty) {
  print('Нет студентов, посетивших все курсы');
} else {
  print('Посетили все курсы: $allCourses');
}
```

## Подсказка 3: Студенты, посетившие хотя бы один курс
Используйте `reduce()` с `union()` для объединения всех студентов:
```dart
var allStudents = courseAttendance.values.reduce((a, b) => a.union(b));
print('Всего уникальных студентов: ${allStudents.length}');
print('Студенты: $allStudents');
```

## Подсказка 4: Студенты на двух конкретных курсах
Для "И" - используйте intersection:
```dart
var dart = courseAttendance['Dart']!;
var flutter = courseAttendance['Flutter']!;

// На обоих курсах (И)
var onBoth = dart.intersection(flutter);
print('На Dart И Flutter: $onBoth');
```

Для "ИЛИ, но не оба" - симметрическая разность:
```dart
// На одном из курсов (ИЛИ)
var onEither = dart.union(flutter);

// На обоих
var onBoth = dart.intersection(flutter);

// На одном, но не на обоих (симметрическая разность)
var onOneOnly = onEither.difference(onBoth);
print('На Dart ИЛИ Flutter (но не оба): $onOneOnly');
```

## Подсказка 5: Самый популярный курс
Перебираем курсы и ищем максимум:
```dart
String mostPopular = '';
int maxStudents = 0;

for (var entry in courseAttendance.entries) {
  if (entry.value.length > maxStudents) {
    maxStudents = entry.value.length;
    mostPopular = entry.key;
  }
}

print('Самый популярный: $mostPopular ($maxStudents студентов)');
```

## Подсказка 6: Подсчет курсов для каждого студента
Перебираем всех студентов и считаем их курсы:
```dart
// Получаем всех уникальных студентов
var allStudents = courseAttendance.values.reduce((a, b) => a.union(b));

// Для каждого студента считаем курсы
for (var student in allStudents) {
  var courses = <String>[];

  // Проверяем каждый курс
  for (var entry in courseAttendance.entries) {
    if (entry.value.contains(student)) {
      courses.add(entry.key);
    }
  }

  print('$student: ${courses.length} курса - $courses');
}
```

## Подсказка 7: Студенты с более чем N курсами
```dart
var activeStudents = <String>{};

for (var student in allStudents) {
  int courseCount = 0;

  for (var students in courseAttendance.values) {
    if (students.contains(student)) {
      courseCount++;
    }
  }

  if (courseCount > 3) {
    activeStudents.add(student);
  }
}

print('Студенты с >3 курсами: $activeStudents');
```

## Подсказка 8: Рекомендации похожих курсов
Находим курсы с наибольшим пересечением студентов:
```dart
void findSimilarCourses(Map<String, Set<String>> courses, String courseName) {
  var targetStudents = courses[courseName]!;
  String mostSimilar = '';
  int maxCommon = 0;

  for (var entry in courses.entries) {
    if (entry.key == courseName) continue; // Пропускаем сам курс

    var common = targetStudents.intersection(entry.value);
    if (common.length > maxCommon) {
      maxCommon = common.length;
      mostSimilar = entry.key;
    }
  }

  if (maxCommon > 0) {
    print('Для $courseName рекомендуем: $mostSimilar ($maxCommon общих студента)');
  }
}
```

## Частые ошибки

### Ошибка 1: Забыть проверить пустоту при reduce
```dart
// ОШИБКА - если нет курсов, будет исключение
var allStudents = courseAttendance.values.reduce((a, b) => a.union(b));

// ПРАВИЛЬНО
if (courseAttendance.isEmpty) {
  print('Нет курсов');
} else {
  var allStudents = courseAttendance.values.reduce((a, b) => a.union(b));
}
```

### Ошибка 2: Путать union и intersection при подсчете "все курсы"
```dart
// НЕПРАВИЛЬНО - даст всех студентов
var attended = courseAttendance.values.reduce((a, b) => a.union(b));

// ПРАВИЛЬНО - только кто посетил все
var attendedAll = courseAttendance.values.reduce((a, b) => a.intersection(b));
```

### Ошибка 3: Не учитывать порядок при симметрической разности
```dart
var a = {1, 2, 3};
var b = {3, 4, 5};

// Симметрическая разность (элементы в одном, но не в обоих)
var symmetric = a.union(b).difference(a.intersection(b));
// {1, 2, 4, 5}
```

## Дополнительные примеры

### Пример 1: Базовая статистика
```dart
Map<String, Set<String>> courses = {
  'Dart': {'Иван', 'Мария', 'Петр', 'Анна'},
  'Flutter': {'Иван', 'Мария', 'Катя'},
  'Firebase': {'Мария', 'Анна', 'Олег'}
};

print('Посещаемость курсов:\n');
for (var entry in courses.entries) {
  print('${entry.key} (${entry.value.length} студентов): ${entry.value}');
}
```

### Пример 2: Поиск пересечений
```dart
var dart = courses['Dart']!;
var flutter = courses['Flutter']!;

// На обоих
var onBoth = dart.intersection(flutter);
print('\nНа Dart И Flutter: $onBoth');

// На одном из них
var onEither = dart.union(flutter);
print('На Dart ИЛИ Flutter: $onEither');

// На одном, но не на обоих
var onOneOnly = onEither.difference(onBoth);
print('На одном (но не оба): $onOneOnly');
```

### Пример 3: Статистика по студентам
```dart
// Все студенты
var allStudents = courses.values.reduce((a, b) => a.union(b));

print('\nСтатистика по студентам:');
for (var student in allStudents) {
  var studentCourses = <String>[];

  for (var entry in courses.entries) {
    if (entry.value.contains(student)) {
      studentCourses.add(entry.key);
    }
  }

  print('$student: ${studentCourses.length} курса - $studentCourses');
}
```

### Пример 4: Активные студенты
```dart
print('\nСтуденты с более чем 2 курсами:');
for (var student in allStudents) {
  int count = 0;

  for (var students in courses.values) {
    if (students.contains(student)) count++;
  }

  if (count > 2) {
    print('- $student: $count курса');
  }
}
```

### Пример 5: Полный анализ
```dart
void main() {
  Map<String, Set<String>> courses = {
    'Dart': {'Иван', 'Мария', 'Петр', 'Анна', 'Олег'},
    'Flutter': {'Иван', 'Мария', 'Петр', 'Катя'},
    'Firebase': {'Мария', 'Анна', 'Катя', 'Олег'},
    'Design': {'Петр', 'Катя', 'Анна'},
    'Testing': {'Иван', 'Мария', 'Олег'}
  };

  print('=== АНАЛИЗ ПОСЕЩАЕМОСТИ КУРСОВ ===\n');

  // 1. Вывод данных
  print('Посещаемость:');
  for (var entry in courses.entries) {
    print('${entry.key}: ${entry.value}');
  }

  // 2. Все студенты
  var allStudents = courses.values.reduce((a, b) => a.union(b));
  print('\nВсего студентов: ${allStudents.length}');

  // 3. Студенты на всех курсах
  var attendedAll = courses.values.reduce((a, b) => a.intersection(b));
  if (attendedAll.isEmpty) {
    print('Студентов на всех курсах: нет');
  }

  // 4. Популярность
  var popular = courses.entries.reduce((a, b) =>
    a.value.length > b.value.length ? a : b
  );
  print('Самый популярный: ${popular.key} (${popular.value.length} студентов)');

  // 5. Статистика по студентам
  print('\nСтатистика по студентам:');
  for (var student in allStudents) {
    var studentCourses = <String>[];

    for (var entry in courses.entries) {
      if (entry.value.contains(student)) {
        studentCourses.add(entry.key);
      }
    }

    print('$student: ${studentCourses.length} курса - $studentCourses');
  }

  // 6. Рекомендации
  print('\nРекомендации:');
  for (var courseName in courses.keys) {
    findSimilarCourses(courses, courseName);
  }
}
```
