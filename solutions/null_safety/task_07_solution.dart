// Задача 7: Работа с nullable коллекциями (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем List<String>? - сам список может быть null
  // Знак ? после List означает, что переменная может содержать null
  List<String>? nullableList = null;

  print('Nullable список: $nullableList');

  // 2. Безопасно получаем длину используя оператор ?.
  // Так как список равен null, результат будет null (без ошибки)
  int? listLength = nullableList?.length;

  print('Длина: $listLength');

  print('');

  // 3. Создаем List<String?> - список не null, но элементы могут быть null
  // Знак ? после String означает, что элементы могут быть null
  List<String?> listWithNullableElements = ['a', null, 'b', null, 'c'];

  print('Список с nullable элементами: $listWithNullableElements');

  // 4. Перебираем список и выводим только не-null элементы
  print('Не-null элементы:');

  // Счетчик не-null элементов
  int nonNullCount = 0;

  // Проверяем каждый элемент по индексу
  // Элемент 0
  if (listWithNullableElements[0] != null) {
    print('- ${listWithNullableElements[0]}');
    nonNullCount = nonNullCount + 1;
  }

  // Элемент 1 (null, не выведется)
  if (listWithNullableElements[1] != null) {
    print('- ${listWithNullableElements[1]}');
    nonNullCount = nonNullCount + 1;
  }

  // Элемент 2
  if (listWithNullableElements[2] != null) {
    print('- ${listWithNullableElements[2]}');
    nonNullCount = nonNullCount + 1;
  }

  // Элемент 3 (null, не выведется)
  if (listWithNullableElements[3] != null) {
    print('- ${listWithNullableElements[3]}');
    nonNullCount = nonNullCount + 1;
  }

  // Элемент 4
  if (listWithNullableElements[4] != null) {
    print('- ${listWithNullableElements[4]}');
    nonNullCount = nonNullCount + 1;
  }

  print('Всего не-null элементов: $nonNullCount');

  print('');

  // 5. Создаем Map<String, int?> - значения могут быть null
  // Ключи - имена студентов, значения - оценки (могут быть null)
  Map<String, int?> scores = {
    'Иван': 100,
    'Мария': null,
    'Петр': 85,
    'Анна': null
  };

  // Выводим оценки студентов
  print('Оценки студентов:');

  // Перебираем Map и выводим информацию о каждом студенте
  scores.forEach((name, score) {
    // Используем оператор ?? для вывода "нет оценки" вместо null
    if (score != null) {
      print('$name: $score');
    } else {
      print('$name: нет оценки');
    }
  });

  print('');

  // 6. Вычисляем средний балл, игнорируя null значения
  // Переменные для подсчета суммы и количества оценок
  int totalScore = 0;
  int studentsWithScores = 0;

  // Проверяем каждую оценку
  if (scores['Иван'] != null) {
    totalScore = totalScore + scores['Иван']!;
    studentsWithScores = studentsWithScores + 1;
  }

  if (scores['Мария'] != null) {
    totalScore = totalScore + scores['Мария']!;
    studentsWithScores = studentsWithScores + 1;
  }

  if (scores['Петр'] != null) {
    totalScore = totalScore + scores['Петр']!;
    studentsWithScores = studentsWithScores + 1;
  }

  if (scores['Анна'] != null) {
    totalScore = totalScore + scores['Анна']!;
    studentsWithScores = studentsWithScores + 1;
  }

  // Вычисляем средний балл
  double averageScore = totalScore / studentsWithScores;

  print('Статистика:');
  print('Средний балл: $averageScore');
  print('Студентов с оценками: $studentsWithScores');

  // 7. Находим студентов без оценки (с null)
  // Счетчик студентов без оценок
  int studentsWithoutScores = 0;

  // Список имен студентов без оценок
  String studentsWithoutScoresNames = '';

  // Проверяем каждого студента
  if (scores['Иван'] == null) {
    studentsWithoutScores = studentsWithoutScores + 1;
    studentsWithoutScoresNames = studentsWithoutScoresNames + 'Иван';
  }

  if (scores['Мария'] == null) {
    studentsWithoutScores = studentsWithoutScores + 1;
    if (studentsWithoutScoresNames != '') {
      studentsWithoutScoresNames = studentsWithoutScoresNames + ', ';
    }
    studentsWithoutScoresNames = studentsWithoutScoresNames + 'Мария';
  }

  if (scores['Петр'] == null) {
    studentsWithoutScores = studentsWithoutScores + 1;
    if (studentsWithoutScoresNames != '') {
      studentsWithoutScoresNames = studentsWithoutScoresNames + ', ';
    }
    studentsWithoutScoresNames = studentsWithoutScoresNames + 'Петр';
  }

  if (scores['Анна'] == null) {
    studentsWithoutScores = studentsWithoutScores + 1;
    if (studentsWithoutScoresNames != '') {
      studentsWithoutScoresNames = studentsWithoutScoresNames + ', ';
    }
    studentsWithoutScoresNames = studentsWithoutScoresNames + 'Анна';
  }

  print('Студентов без оценок: $studentsWithoutScores ($studentsWithoutScoresNames)');
}
