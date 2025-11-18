// Задача 4: Проверка наличия ключей и значений (Легкая)
//
// ОПИСАНИЕ:
// Map предоставляет методы для проверки наличия ключей и значений:
// - containsKey(key) - проверяет наличие ключа
// - containsValue(value) - проверяет наличие значения
// - isEmpty - проверяет, пустой ли Map
// - isNotEmpty - проверяет, не пустой ли Map
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте Map<String, int> inventory (инвентарь) с предметами и количеством:
//    'яблоко': 5, 'хлеб': 2, 'молоко': 3, 'сыр': 1
// 2. Проверьте, есть ли в инвентаре 'яблоко'
// 3. Проверьте, есть ли в инвентаре 'мясо'
// 4. Проверьте, есть ли в инвентаре количество 3
// 5. Проверьте, есть ли в инвентаре количество 10
// 6. Проверьте, пустой ли инвентарь
// 7. Выведите все результаты проверок
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Инвентарь: {яблоко: 5, хлеб: 2, молоко: 3, сыр: 1}
//
// Проверки наличия:
// Есть яблоко: true
// Есть мясо: false
// Есть количество 3: true
// Есть количество 10: false
// Инвентарь пустой: false
// Инвентарь не пустой: true
// Всего позиций: 4

void main() {
    Map inventory={
    'apple': 5,
    'bread': 2,
    'milk': 3,
    'cheese': 1
  };
  print('Does the inventory contain apples? ${inventory.containsKey('apple')}');
  print('Does the inventory contain meat? ${inventory.containsKey('meat')}');
  print('Does the inventory contain 3 items? ${inventory.containsValue(3)}');
  print('Does the inventory contain 10 items? ${inventory.containsValue(10)}');
  print('Is the inventory empty? ${inventory.isEmpty}');
  print('Is the inventory NOT empty? ${inventory.isNotEmpty}');
  print('Inventory size: ${inventory.length}');

}
