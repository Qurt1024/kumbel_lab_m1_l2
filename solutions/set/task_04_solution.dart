// Задача 4: Доступ к элементам Set (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем Set<String> colors с цветами
  var colors = <String>{'красный', 'зеленый', 'синий', 'желтый', 'оранжевый'};

  // 2. Выводим множество целиком
  print('Множество цветов: $colors');
  print('');

  // 3. Выводим первый элемент
  // .first возвращает первый элемент множества
  print('Первый цвет: ${colors.first}');

  // 4. Выводим последний элемент
  // .last возвращает последний элемент множества
  print('Последний цвет: ${colors.last}');
  print('');

  // 5. Конвертируем Set в List и сохраняем в переменную
  // Это нужно для доступа к элементам по индексу
  // Set не поддерживает индексы напрямую!
  var colorsList = colors.toList();
  print('Список из множества: $colorsList');
  print('');

  // 6. Выводим элементы List по индексам
  // Теперь можем использовать индексы [0], [1], [2] и т.д.
  print('Цвета по индексам:');
  print('Индекс 0: ${colorsList[0]}');
  print('Индекс 1: ${colorsList[1]}');
  print('Индекс 2: ${colorsList[2]}');
  print('Индекс 3: ${colorsList[3]}');
  print('Индекс 4: ${colorsList[4]}');
  print('');

  // 7. Выводим каждый цвет в верхнем регистре
  // .toUpperCase() преобразует строку в верхний регистр
  print('Цвета в верхнем регистре:');
  print(colorsList[0].toUpperCase());
  print(colorsList[1].toUpperCase());
  print(colorsList[2].toUpperCase());
  print(colorsList[3].toUpperCase());
  print(colorsList[4].toUpperCase());
  print('');

  // 8. Проверяем, пустое ли множество
  // .isEmpty возвращает true если множество пустое
  print('Множество пустое: ${colors.isEmpty}');

  // 9. Проверяем размер множества
  // .length возвращает количество элементов
  print('Размер множества: ${colors.length}');
}
