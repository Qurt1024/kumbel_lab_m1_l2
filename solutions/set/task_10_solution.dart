// Задача 10: Анализ посещаемости курсов (Сложная) - РЕШЕНИЕ

void main() {
  print('Посещаемость курсов:');
  print('');

  // 1. Создаем Map<String, Set<String>> courseAttendance
  var courseAttendance = <String, Set<String>>{};

  // 2. Добавляем данные для 5 курсов
  courseAttendance['Dart'] = {'Иван', 'Мария', 'Петр', 'Анна', 'Олег'};
  courseAttendance['Flutter'] = {'Иван', 'Мария', 'Петр', 'Катя'};
  courseAttendance['Firebase'] = {'Мария', 'Анна', 'Катя', 'Олег'};
  courseAttendance['Design'] = {'Петр', 'Катя', 'Анна'};
  courseAttendance['Testing'] = {'Иван', 'Мария', 'Олег'};

  // Выводим информацию о каждом курсе
  print('Dart (${courseAttendance['Dart']!.length} студентов): ${courseAttendance['Dart']}');
  print('Flutter (${courseAttendance['Flutter']!.length} студента): ${courseAttendance['Flutter']}');
  print('Firebase (${courseAttendance['Firebase']!.length} студента): ${courseAttendance['Firebase']}');
  print('Design (${courseAttendance['Design']!.length} студента): ${courseAttendance['Design']}');
  print('Testing (${courseAttendance['Testing']!.length} студента): ${courseAttendance['Testing']}');
  print('');

  // 3. Анализ посещаемости
  print('Анализ посещаемости:');
  print('');

  // Находим всех уникальных студентов (объединение всех множеств)
  var allStudents = <String>{};
  allStudents = allStudents.union(courseAttendance['Dart']!);
  allStudents = allStudents.union(courseAttendance['Flutter']!);
  allStudents = allStudents.union(courseAttendance['Firebase']!);
  allStudents = allStudents.union(courseAttendance['Design']!);
  allStudents = allStudents.union(courseAttendance['Testing']!);

  // Находим студентов, посетивших все курсы (пересечение всех множеств)
  var studentsAllCourses = Set<String>.from(courseAttendance['Dart']!);
  studentsAllCourses = studentsAllCourses.intersection(courseAttendance['Flutter']!);
  studentsAllCourses = studentsAllCourses.intersection(courseAttendance['Firebase']!);
  studentsAllCourses = studentsAllCourses.intersection(courseAttendance['Design']!);
  studentsAllCourses = studentsAllCourses.intersection(courseAttendance['Testing']!);

  if (studentsAllCourses.isEmpty) {
    print('Студенты, посетившие все курсы: нет');
  } else {
    print('Студенты, посетившие все курсы: $studentsAllCourses');
  }

  print('Всего уникальных студентов: ${allStudents.length}');
  print('Все студенты: $allStudents');
  print('');

  // Студенты на Dart И Flutter (пересечение двух множеств)
  var dartAndFlutter = courseAttendance['Dart']!.intersection(courseAttendance['Flutter']!);
  print('Студенты на Dart И Flutter: $dartAndFlutter');

  // Студенты на Dart ИЛИ Flutter, но не оба
  // Объединяем оба множества и вычитаем пересечение
  var dartOrFlutter = courseAttendance['Dart']!.union(courseAttendance['Flutter']!);
  dartOrFlutter = dartOrFlutter.difference(dartAndFlutter);
  print('Студенты на Dart ИЛИ Flutter (но не оба): $dartOrFlutter');
  print('');

  // Самый популярный курс (больше всего студентов)
  var maxStudents = 0;
  var mostPopularCourse = '';

  if (courseAttendance['Dart']!.length > maxStudents) {
    maxStudents = courseAttendance['Dart']!.length;
    mostPopularCourse = 'Dart';
  }
  if (courseAttendance['Flutter']!.length > maxStudents) {
    maxStudents = courseAttendance['Flutter']!.length;
    mostPopularCourse = 'Flutter';
  }
  if (courseAttendance['Firebase']!.length > maxStudents) {
    maxStudents = courseAttendance['Firebase']!.length;
    mostPopularCourse = 'Firebase';
  }
  if (courseAttendance['Design']!.length > maxStudents) {
    maxStudents = courseAttendance['Design']!.length;
    mostPopularCourse = 'Design';
  }
  if (courseAttendance['Testing']!.length > maxStudents) {
    maxStudents = courseAttendance['Testing']!.length;
    mostPopularCourse = 'Testing';
  }

  print('Самый популярный курс: $mostPopularCourse ($maxStudents студентов)');

  // Самый непопулярный курс (меньше всего студентов)
  var minStudents = 999;
  var leastPopularCourse = '';

  if (courseAttendance['Dart']!.length < minStudents) {
    minStudents = courseAttendance['Dart']!.length;
    leastPopularCourse = 'Dart';
  }
  if (courseAttendance['Flutter']!.length < minStudents) {
    minStudents = courseAttendance['Flutter']!.length;
    leastPopularCourse = 'Flutter';
  }
  if (courseAttendance['Firebase']!.length < minStudents) {
    minStudents = courseAttendance['Firebase']!.length;
    leastPopularCourse = 'Firebase';
  }
  if (courseAttendance['Design']!.length < minStudents) {
    minStudents = courseAttendance['Design']!.length;
    leastPopularCourse = 'Design';
  }
  if (courseAttendance['Testing']!.length < minStudents) {
    minStudents = courseAttendance['Testing']!.length;
    leastPopularCourse = 'Testing';
  }

  print('Самый непопулярный курс: $leastPopularCourse ($minStudents студента)');
  print('');

  // 4. Статистика по студентам
  print('Статистика по студентам:');

  // Для каждого студента подсчитываем количество курсов
  // Создаем Map для хранения курсов каждого студента
  var studentCourses = <String, Set<String>>{};
  studentCourses['Иван'] = <String>{};
  studentCourses['Мария'] = <String>{};
  studentCourses['Петр'] = <String>{};
  studentCourses['Анна'] = <String>{};
  studentCourses['Олег'] = <String>{};
  studentCourses['Катя'] = <String>{};

  // Проходим по каждому курсу и добавляем его студентам
  if (courseAttendance['Dart']!.contains('Иван')) studentCourses['Иван']!.add('Dart');
  if (courseAttendance['Dart']!.contains('Мария')) studentCourses['Мария']!.add('Dart');
  if (courseAttendance['Dart']!.contains('Петр')) studentCourses['Петр']!.add('Dart');
  if (courseAttendance['Dart']!.contains('Анна')) studentCourses['Анна']!.add('Dart');
  if (courseAttendance['Dart']!.contains('Олег')) studentCourses['Олег']!.add('Dart');

  if (courseAttendance['Flutter']!.contains('Иван')) studentCourses['Иван']!.add('Flutter');
  if (courseAttendance['Flutter']!.contains('Мария')) studentCourses['Мария']!.add('Flutter');
  if (courseAttendance['Flutter']!.contains('Петр')) studentCourses['Петр']!.add('Flutter');
  if (courseAttendance['Flutter']!.contains('Катя')) studentCourses['Катя']!.add('Flutter');

  if (courseAttendance['Firebase']!.contains('Мария')) studentCourses['Мария']!.add('Firebase');
  if (courseAttendance['Firebase']!.contains('Анна')) studentCourses['Анна']!.add('Firebase');
  if (courseAttendance['Firebase']!.contains('Катя')) studentCourses['Катя']!.add('Firebase');
  if (courseAttendance['Firebase']!.contains('Олег')) studentCourses['Олег']!.add('Firebase');

  if (courseAttendance['Design']!.contains('Петр')) studentCourses['Петр']!.add('Design');
  if (courseAttendance['Design']!.contains('Катя')) studentCourses['Катя']!.add('Design');
  if (courseAttendance['Design']!.contains('Анна')) studentCourses['Анна']!.add('Design');

  if (courseAttendance['Testing']!.contains('Иван')) studentCourses['Иван']!.add('Testing');
  if (courseAttendance['Testing']!.contains('Мария')) studentCourses['Мария']!.add('Testing');
  if (courseAttendance['Testing']!.contains('Олег')) studentCourses['Олег']!.add('Testing');

  // Выводим статистику по каждому студенту
  print('Иван: ${studentCourses['Иван']!.length} курса ${studentCourses['Иван']}');
  print('Мария: ${studentCourses['Мария']!.length} курса ${studentCourses['Мария']}');
  print('Петр: ${studentCourses['Петр']!.length} курса ${studentCourses['Петр']}');
  print('Анна: ${studentCourses['Анна']!.length} курса ${studentCourses['Анна']}');
  print('Олег: ${studentCourses['Олег']!.length} курса ${studentCourses['Олег']}');
  print('Катя: ${studentCourses['Катя']!.length} курса ${studentCourses['Катя']}');
  print('');

  // 5. Находим студентов с более чем 3 курсами
  var studentsWithMoreThan3 = <String>{};
  if (studentCourses['Иван']!.length > 3) studentsWithMoreThan3.add('Иван');
  if (studentCourses['Мария']!.length > 3) studentsWithMoreThan3.add('Мария');
  if (studentCourses['Петр']!.length > 3) studentsWithMoreThan3.add('Петр');
  if (studentCourses['Анна']!.length > 3) studentsWithMoreThan3.add('Анна');
  if (studentCourses['Олег']!.length > 3) studentsWithMoreThan3.add('Олег');
  if (studentCourses['Катя']!.length > 3) studentsWithMoreThan3.add('Катя');

  print('Студенты с >3 курсами: $studentsWithMoreThan3');
  print('');

  // 6. Рекомендации похожих курсов
  print('Рекомендации похожих курсов:');

  // Для Dart находим курс с максимальным пересечением студентов
  var dartStudents = courseAttendance['Dart']!;
  var maxCommonWithDart = 0;
  var similarToDart = '';

  var dartFlutterCommon = dartStudents.intersection(courseAttendance['Flutter']!).length;
  if (dartFlutterCommon > maxCommonWithDart) {
    maxCommonWithDart = dartFlutterCommon;
    similarToDart = 'Flutter';
  }

  print('Для Dart рекомендуем: $similarToDart ($maxCommonWithDart общих студента)');

  // Для Flutter находим курс с максимальным пересечением студентов
  var flutterStudents = courseAttendance['Flutter']!;
  var maxCommonWithFlutter = 0;
  var similarToFlutter = '';

  var flutterDartCommon = flutterStudents.intersection(courseAttendance['Dart']!).length;
  if (flutterDartCommon > maxCommonWithFlutter) {
    maxCommonWithFlutter = flutterDartCommon;
    similarToFlutter = 'Dart';
  }

  print('Для Flutter рекомендуем: $similarToFlutter ($maxCommonWithFlutter общих студента)');

  // Для Firebase находим курс с максимальным пересечением студентов
  var firebaseStudents = courseAttendance['Firebase']!;
  var maxCommonWithFirebase = 0;
  var similarToFirebase = '';

  var firebaseDesignCommon = firebaseStudents.intersection(courseAttendance['Design']!).length;
  if (firebaseDesignCommon > maxCommonWithFirebase) {
    maxCommonWithFirebase = firebaseDesignCommon;
    similarToFirebase = 'Design';
  }

  print('Для Firebase рекомендуем: $similarToFirebase ($maxCommonWithFirebase общих студента)');
}
