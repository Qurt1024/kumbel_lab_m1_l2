// Задача 6: Вложенные Map (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map с информацией о студентах
  // Map<String, Map<String, dynamic>> означает:
  // - Ключ внешнего Map - String (ID студента)
  // - Значение - это другой Map с данными студента
  // - dynamic означает, что значения во внутреннем Map могут быть разных типов
  Map<String, Map<String, dynamic>> students = {
    'STU001': {
      'name': 'Иван',
      'age': 20,
      'course': 2,
      'gpa': 4.5
    },
    'STU002': {
      'name': 'Мария',
      'age': 19,
      'course': 1,
      'gpa': 4.8
    },
    'STU003': {
      'name': 'Петр',
      'age': 21,
      'course': 3,
      'gpa': 4.2
    }
  };

  // 2. Выводим информацию о каждом студенте
  print('База данных студентов:');
  print('');

  // Для студента STU001
  print('ID: STU001');
  print('Имя: ${students['STU001']!['name']}');          // обращаемся к вложенному Map
  print('Возраст: ${students['STU001']!['age']} лет');
  print('Курс: ${students['STU001']!['course']}');
  print('Средний балл: ${students['STU001']!['gpa']}');
  print('---');

  // Для студента STU002
  print('ID: STU002');
  print('Имя: ${students['STU002']!['name']}');
  print('Возраст: ${students['STU002']!['age']} лет');
  print('Курс: ${students['STU002']!['course']}');
  print('Средний балл: ${students['STU002']!['gpa']}');
  print('---');

  // Для студента STU003
  print('ID: STU003');
  print('Имя: ${students['STU003']!['name']}');
  print('Возраст: ${students['STU003']!['age']} лет');
  print('Курс: ${students['STU003']!['course']}');
  print('Средний балл: ${students['STU003']!['gpa']}');
  print('---');
  print('');

  // 3. Находим студента с лучшим средним баллом
  // Получаем все значения GPA и сравниваем их
  var gpa1 = students['STU001']!['gpa'] as double;
  var gpa2 = students['STU002']!['gpa'] as double;
  var gpa3 = students['STU003']!['gpa'] as double;

  // Ищем максимальный GPA и соответствующего студента
  var bestGpa = gpa1;
  var bestStudent = students['STU001']!['name'];

  if (gpa2 > bestGpa) {
    bestGpa = gpa2;
    bestStudent = students['STU002']!['name'];
  }
  if (gpa3 > bestGpa) {
    bestGpa = gpa3;
    bestStudent = students['STU003']!['name'];
  }

  print('Лучший студент: $bestStudent (GPA: $bestGpa)');

  // 4. Находим всех студентов на 2 курсе
  // Проверяем курс каждого студента
  // В нашем случае только Иван на 2 курсе
  var secondYearStudents = '';
  if (students['STU001']!['course'] == 2) {
    secondYearStudents = students['STU001']!['name'] as String;
  }
  print('Студенты на 2 курсе: $secondYearStudents');

  // 5. Вычисляем средний возраст студентов
  var age1 = students['STU001']!['age'] as int;
  var age2 = students['STU002']!['age'] as int;
  var age3 = students['STU003']!['age'] as int;

  var averageAge = (age1 + age2 + age3) / students.length;
  print('Средний возраст: $averageAge лет');
}
