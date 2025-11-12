// Задача 4: Проверка наличия ключей и значений (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map<String, int> с инвентарем (предметы и их количество)
  Map<String, int> inventory = {
    'яблоко': 5,
    'хлеб': 2,
    'молоко': 3,
    'сыр': 1
  };

  // Выводим текущий инвентарь
  print('Инвентарь: $inventory');
  print('');

  print('Проверки наличия:');

  // 2. Проверяем, есть ли в инвентаре 'яблоко'
  // Метод .containsKey(key) возвращает true, если ключ существует в Map
  var hasApple = inventory.containsKey('яблоко');
  print('Есть яблоко: $hasApple');

  // 3. Проверяем, есть ли в инвентаре 'мясо'
  // Ключа 'мясо' нет в Map, поэтому получим false
  var hasMeat = inventory.containsKey('мясо');
  print('Есть мясо: $hasMeat');

  // 4. Проверяем, есть ли в инвентаре количество 3
  // Метод .containsValue(value) возвращает true, если значение существует в Map
  var hasQuantity3 = inventory.containsValue(3);
  print('Есть количество 3: $hasQuantity3');

  // 5. Проверяем, есть ли в инвентаре количество 10
  // Значения 10 нет ни у одного предмета, поэтому получим false
  var hasQuantity10 = inventory.containsValue(10);
  print('Есть количество 10: $hasQuantity10');

  // 6. Проверяем, пустой ли инвентарь
  // Свойство .isEmpty возвращает true, если Map не содержит элементов
  var isEmpty = inventory.isEmpty;
  print('Инвентарь пустой: $isEmpty');

  // Свойство .isNotEmpty возвращает true, если Map содержит хотя бы один элемент
  var isNotEmpty = inventory.isNotEmpty;
  print('Инвентарь не пустой: $isNotEmpty');

  // Выводим количество позиций в инвентаре
  print('Всего позиций: ${inventory.length}');
}
