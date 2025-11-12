// Задача 7: Проверка подмножеств (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Set<String> allFruits - все фрукты в магазине
  var allFruits = <String>{'яблоко', 'банан', 'апельсин', 'груша', 'киви', 'манго'};

  // 2. Создаем Set<String> basket1 - корзина покупателя 1
  var basket1 = <String>{'яблоко', 'банан'};

  // 3. Создаем Set<String> basket2 - корзина покупателя 2
  var basket2 = <String>{'апельсин', 'груша', 'ананас'};

  print('Фрукты в магазине: $allFruits');
  print('');
  print('Корзина покупателя 1: $basket1');
  print('Корзина покупателя 2: $basket2');
  print('');

  // 4. Проверяем, все ли фрукты из basket1 есть в магазине
  // .containsAll() проверяет, содержит ли множество ВСЕ элементы другого множества
  print('Проверка корзины 1:');
  var basket1InStore = allFruits.containsAll(basket1);
  print('Все фрукты из корзины 1 есть в магазине: $basket1InStore');
  print('');

  // 5. Проверяем, все ли фрукты из basket2 есть в магазине
  print('Проверка корзины 2:');
  var basket2InStore = allFruits.containsAll(basket2);
  print('Все фрукты из корзины 2 есть в магазине: $basket2InStore');

  // Находим отсутствующие фрукты
  // .difference() показывает какие фрукты есть в корзине, но нет в магазине
  var missingFruits = basket2.difference(allFruits);
  print('Отсутствующие фрукты: $missingFruits');
  print('');

  // 6. Находим фрукты, которые купил первый, но не купил второй
  // basket1.difference(basket2) - элементы из basket1, которых нет в basket2
  var onlyFirstBuyer = basket1.difference(basket2);
  print('Купил первый, но не второй: $onlyFirstBuyer');

  // 7. Находим фрукты, которые купил хотя бы один из покупателей
  // .union() объединяет оба множества (все уникальные покупки)
  var anyBuyer = basket1.union(basket2);
  print('Купил хотя бы один: $anyBuyer');

  // 8. Находим фрукты, которые остались в магазине (не купили)
  // allFruits.difference(anyBuyer) - фрукты из магазина, которые никто не купил
  var remainingInStore = allFruits.difference(anyBuyer);
  print('Остались в магазине: $remainingInStore');
}
