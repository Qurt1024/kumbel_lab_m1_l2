// Задача 5: Операции с множествами - union (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Set<int> groupA с числами
  var groupA = <int>{1, 2, 3, 4, 5};

  // 2. Создаем Set<int> groupB с числами
  var groupB = <int>{4, 5, 6, 7, 8};

  print('Группа A: $groupA');
  print('Группа B: $groupB');
  print('');

  // 3. Находим объединение (union)
  // .union() объединяет два множества, возвращая все уникальные элементы
  // Элементы 4 и 5 есть в обоих множествах, но в результате будут только один раз
  var unionSet = groupA.union(groupB);
  print('Объединение (A ∪ B): $unionSet');
  print('Все уникальные элементы из обоих множеств');
  print('');

  // 4. Находим пересечение (intersection)
  // .intersection() возвращает только элементы, которые есть в ОБОИХ множествах
  var intersectionSet = groupA.intersection(groupB);
  print('Пересечение (A ∩ B): $intersectionSet');
  print('Элементы, которые есть и в A, и в B');
  print('');

  // 5. Находим разность (A - B)
  // .difference() возвращает элементы из первого множества, которых НЕТ во втором
  var differenceAB = groupA.difference(groupB);
  print('Разность (A - B): $differenceAB');
  print('Элементы, которые есть в A, но нет в B');
  print('');

  // 6. Находим разность (B - A)
  // Порядок важен! B.difference(A) != A.difference(B)
  var differenceBA = groupB.difference(groupA);
  print('Разность (B - A): $differenceBA');
  print('Элементы, которые есть в B, но нет в A');
}
