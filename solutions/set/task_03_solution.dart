// Задача 3: Преобразование между List и Set (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем List<int> с дубликатами
  var numbersWithDuplicates = [1, 2, 3, 2, 4, 1, 5, 3, 6, 4, 7, 5];

  // 3. Выводим исходный список и его длину
  print('Исходный список: $numbersWithDuplicates');
  print('Длина списка: ${numbersWithDuplicates.length}');
  print('');

  // 2. Преобразуем список в Set чтобы удалить дубликаты
  // .toSet() создает множество из списка, автоматически удаляя дубликаты
  print('Преобразование в Set...');
  var uniqueNumbers = numbersWithDuplicates.toSet();

  // 4. Выводим множество без дубликатов и его длину
  print('Уникальные числа: $uniqueNumbers');
  print('Количество уникальных: ${uniqueNumbers.length}');

  // Вычисляем сколько дубликатов было удалено
  var duplicatesRemoved = numbersWithDuplicates.length - uniqueNumbers.length;
  print('Удалено дубликатов: $duplicatesRemoved');
  print('');

  // 5. Преобразуем Set обратно в List
  // .toList() создает список из множества
  var listFromSet = uniqueNumbers.toList();
  print('Преобразование обратно в List: $listFromSet');
  print('');

  // 6. Создаем List<String> names с дубликатами имен
  var names = ['Иван', 'Мария', 'Петр', 'Иван', 'Анна', 'Мария', 'Иван'];
  print('Список имен: $names');

  // 7. Находим уникальные имена используя Set
  // Преобразуем список в множество для получения уникальных значений
  var uniqueNames = names.toSet();
  print('Уникальные имена: $uniqueNames');
  print('Всего уникальных имен: ${uniqueNames.length}');
}
