// Задача 4: Проверка содержимого списка (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем список students
  var students = ['Иван', 'Мария', 'Петр', 'Анна', 'Дмитрий'];

  print('Список студентов: $students');
  print('');

  // 2. Проверяем, есть ли в списке 'Мария' и выводим результат
  // Метод .contains() возвращает true, если элемент есть в списке, иначе false
  print('Проверки:');
  var hasMaria = students.contains('Мария');
  print('Мария в списке: $hasMaria');

  // 3. Проверяем, есть ли в списке 'Олег' и выводим результат
  var hasOleg = students.contains('Олег');
  print('Олег в списке: $hasOleg');

  // 4. Находим индекс 'Петр' в списке
  // Метод .indexOf() возвращает индекс первого вхождения элемента
  // Если элемент не найден, возвращается -1
  var petrIndex = students.indexOf('Петр');
  print('Индекс Петр: $petrIndex');

  // 5. Проверяем, пустой ли список
  // Свойство .isEmpty возвращает true, если список пустой
  var isStudentsEmpty = students.isEmpty;
  print('Список пустой: $isStudentsEmpty');

  // 6. Создаем пустой список emptyList и проверяем, пустой ли он
  var emptyList = [];
  var isEmptyListEmpty = emptyList.isEmpty;
  print('Пустой список пустой: $isEmptyListEmpty');

  // 7. Выводим количество студентов
  print('Количество студентов: ${students.length}');
}
