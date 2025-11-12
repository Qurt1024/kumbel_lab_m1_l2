// Задача 6: Списки с разными типами данных (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем List<dynamic> studentInfo с информацией о студенте
  // List<dynamic> позволяет хранить элементы разных типов
  List<dynamic> studentInfo = ['Иван', 20, 4.5, true];

  // 2. Выводим каждый элемент с описанием его типа
  print('Информация о студенте:');
  print('Имя: ${studentInfo[0]} (${studentInfo[0].runtimeType})');
  print('Возраст: ${studentInfo[1]} (${studentInfo[1].runtimeType})');
  print('Средний балл: ${studentInfo[2]} (${studentInfo[2].runtimeType})');
  print('Активен: ${studentInfo[3]} (${studentInfo[3].runtimeType})');
  print('');

  // 3. Создаем двумерный список (список списков) grades с оценками 3 студентов
  // Каждый элемент - это список оценок одного студента
  var grades = [
    [5, 4, 5, 4],  // Студент 1
    [3, 4, 4, 5],  // Студент 2
    [5, 5, 4, 5],  // Студент 3
  ];

  print('Оценки студентов:');

  // 4. Вычисляем средний балл для каждого студента
  // Для студента 1
  var student1Grades = grades[0];
  var student1Sum = student1Grades[0] + student1Grades[1] + student1Grades[2] + student1Grades[3];
  var student1Average = student1Sum / student1Grades.length;
  print('Студент 1: $student1Grades - Средний балл: $student1Average');

  // Для студента 2
  var student2Grades = grades[1];
  var student2Sum = student2Grades[0] + student2Grades[1] + student2Grades[2] + student2Grades[3];
  var student2Average = student2Sum / student2Grades.length;
  print('Студент 2: $student2Grades - Средний балл: $student2Average');

  // Для студента 3
  var student3Grades = grades[2];
  var student3Sum = student3Grades[0] + student3Grades[1] + student3Grades[2] + student3Grades[3];
  var student3Average = student3Sum / student3Grades.length;
  print('Студент 3: $student3Grades - Средний балл: $student3Average');
  print('');

  // 5. Находим студента с лучшим средним баллом
  // Сравниваем средние баллы всех студентов
  var bestAverage = student1Average;
  var bestStudent = 'Студент 1';

  if (student2Average > bestAverage) {
    bestAverage = student2Average;
    bestStudent = 'Студент 2';
  }

  if (student3Average > bestAverage) {
    bestAverage = student3Average;
    bestStudent = 'Студент 3';
  }

  print('Лучший студент: $bestStudent (средний балл: $bestAverage)');
}
