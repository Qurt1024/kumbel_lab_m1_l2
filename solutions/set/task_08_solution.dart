// Задача 8: Фильтрация Set с помощью where (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Set<int> numbers с числами от 1 до 20
  var numbers = <int>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};

  print('Исходное множество: $numbers');
  print('');

  // 2. Находим все четные числа
  // .where() фильтрует элементы по условию
  // Число четное, если остаток от деления на 2 равен 0
  var evenNumbers = numbers.where((n) => n % 2 == 0).toSet();
  print('Четные числа: $evenNumbers');
  print('Количество: ${evenNumbers.length}');
  print('');

  // 3. Находим все нечетные числа
  // Число нечетное, если остаток от деления на 2 равен 1
  var oddNumbers = numbers.where((n) => n % 2 == 1).toSet();
  print('Нечетные числа: $oddNumbers');
  print('Количество: ${oddNumbers.length}');
  print('');

  // 4. Находим все числа, которые делятся на 3
  // Число делится на 3, если остаток от деления на 3 равен 0
  var divisibleBy3 = numbers.where((n) => n % 3 == 0).toSet();
  print('Числа, делящиеся на 3: $divisibleBy3');
  print('Количество: ${divisibleBy3.length}');
  print('');

  // 5. Находим все простые числа
  // Простое число делится только на 1 и на себя
  // Для проверки нужно убедиться, что нет других делителей
  var primeNumbers = numbers.where((n) {
    if (n < 2) return false;
    for (var i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }).toSet();
  print('Простые числа: $primeNumbers');
  print('Количество: ${primeNumbers.length}');
  print('');

  // 6. Проверяем, есть ли хотя бы одно число > 15
  // .any() возвращает true если хотя бы один элемент удовлетворяет условию
  var hasGreaterThan15 = numbers.any((n) => n > 15);
  print('Есть число > 15: $hasGreaterThan15');

  // 7. Проверяем, все ли числа положительные
  // .every() возвращает true если ВСЕ элементы удовлетворяют условию
  var allPositive = numbers.every((n) => n > 0);
  print('Все числа положительные: $allPositive');
  print('');

  // 8. Создаем Set квадратов всех четных чисел
  // .map() преобразует каждый элемент
  // Берем четные числа и возводим каждое в квадрат (n * n)
  var evenSquares = evenNumbers.map((n) => n * n).toSet();
  print('Квадраты четных чисел: $evenSquares');
}
