// Задача 4: Неизменяемые переменные с final (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем final переменную currentYear
  final currentYear = 2025;

  // 2. Создаем final переменную birthYear
  final birthYear = 2005;

  // 3. Вычисляем возраст
  var age = currentYear - birthYear;

  // 4-7. Выводим результаты
  print('Год рождения: $birthYear');
  print('Текущий год: $currentYear');
  print('Возраст: $age');

  // Дополнительно: объяснение разницы между const и final
  print('\n--- Разница между const и final ---');

  // const - значение должно быть известно во время компиляции
  const compileTimeValue = 100; // Известно до запуска

  // final - значение может быть вычислено во время выполнения
  final runtimeValue = currentYear - birthYear; // Вычисляется при выполнении

  // final нельзя изменить после присваивания
  // currentYear = 2026; // ОШИБКА!
  // birthYear = 2000; // ОШИБКА!

  // Но age можно изменить (это обычная var)
  age = 25;
  print('Возраст после изменения: $age');
}
