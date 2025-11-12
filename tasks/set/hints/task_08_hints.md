# Подсказки к Задаче 8: Фильтрация Set с помощью where

## Подсказка 1: Метод where() для фильтрации
Метод `where()` возвращает элементы, удовлетворяющие условию:
```dart
var numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// Фильтруем четные числа
var evenNumbers = numbers.where((n) => n % 2 == 0);
print(evenNumbers.toSet()); // {2, 4, 6, 8, 10}
```

**ВАЖНО:** `where()` возвращает `Iterable`, нужно преобразовать в Set через `.toSet()`

## Подсказка 2: Проверка четности и нечетности
```dart
// Четные числа (делятся на 2 без остатка)
var even = numbers.where((n) => n % 2 == 0).toSet();

// Нечетные числа (остаток от деления на 2 равен 1)
var odd = numbers.where((n) => n % 2 != 0).toSet();
// или
var odd = numbers.where((n) => n % 2 == 1).toSet();
```

## Подсказка 3: Метод any() - проверка "хотя бы один"
Проверяет, есть ли хотя бы один элемент, удовлетворяющий условию:
```dart
var numbers = {1, 5, 8, 12, 20};

var hasLarge = numbers.any((n) => n > 15);
print(hasLarge); // true - есть 20

var hasNegative = numbers.any((n) => n < 0);
print(hasNegative); // false
```

## Подсказка 4: Метод every() - проверка "все"
Проверяет, все ли элементы удовлетворяют условию:
```dart
var numbers = {1, 5, 8, 12, 20};

var allPositive = numbers.every((n) => n > 0);
print(allPositive); // true - все положительные

var allEven = numbers.every((n) => n % 2 == 0);
print(allEven); // false - не все четные
```

## Подсказка 5: Проверка простых чисел
Простое число делится только на 1 и само себя:
```dart
bool isPrime(int number) {
  if (number < 2) return false;

  // Проверяем делители от 2 до корня из числа
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }

  return true;
}

var numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
var primes = numbers.where((n) => isPrime(n)).toSet();
print(primes); // {2, 3, 5, 7}
```

## Подсказка 6: Метод map() для преобразования
Преобразует каждый элемент по правилу:
```dart
var numbers = {1, 2, 3, 4, 5};

// Квадраты чисел
var squares = numbers.map((n) => n * n).toSet();
print(squares); // {1, 4, 9, 16, 25}

// Можно комбинировать where и map
var evenSquares = numbers
    .where((n) => n % 2 == 0)  // Сначала фильтруем четные
    .map((n) => n * n)          // Потом возводим в квадрат
    .toSet();
print(evenSquares); // {4, 16}
```

## Частые ошибки

### Ошибка 1: Забыть .toSet() после where()
```dart
var numbers = {1, 2, 3, 4, 5};
var even = numbers.where((n) => n % 2 == 0);
// even это Iterable, а не Set!

// ПРАВИЛЬНО
var even = numbers.where((n) => n % 2 == 0).toSet();
```

### Ошибка 2: Неправильная проверка простых чисел
```dart
// НЕПРАВИЛЬНО - слишком медленно для больших чисел
bool isPrime(int n) {
  for (int i = 2; i < n; i++) {  // проверяем ВСЕ числа
    if (n % i == 0) return false;
  }
  return true;
}

// ПРАВИЛЬНО - проверяем только до корня
bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {  // только до √n
    if (n % i == 0) return false;
  }
  return true;
}
```

### Ошибка 3: Путать any() и every()
```dart
var numbers = {1, 2, 3, 4, 5};

// any - хотя бы ОДИН
numbers.any((n) => n > 3); // true (есть 4 и 5)

// every - ВСЕ
numbers.every((n) => n > 3); // false (не все > 3)
```

## Дополнительные примеры

### Пример 1: Комплексная фильтрация
```dart
var numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

// Четные
var even = numbers.where((n) => n % 2 == 0).toSet();
print('Четные: $even');

// Нечетные
var odd = numbers.where((n) => n % 2 != 0).toSet();
print('Нечетные: $odd');

// Делятся на 3
var divisibleBy3 = numbers.where((n) => n % 3 == 0).toSet();
print('Кратные 3: $divisibleBy3');

// Больше 10
var moreThan10 = numbers.where((n) => n > 10).toSet();
print('Больше 10: $moreThan10');
```

### Пример 2: Использование any() и every()
```dart
var ages = {18, 21, 25, 30, 45};

print('Есть совершеннолетние: ${ages.any((age) => age >= 18)}');
print('Все совершеннолетние: ${ages.every((age) => age >= 18)}');
print('Есть пенсионеры: ${ages.any((age) => age >= 65)}');
print('Все молодые (<30): ${ages.every((age) => age < 30)}');
```

### Пример 3: Цепочки операций
```dart
var numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// Четные числа, возведенные в квадрат
var result = numbers
    .where((n) => n % 2 == 0)
    .map((n) => n * n)
    .toSet();
print('Квадраты четных: $result'); // {4, 16, 36, 64, 100}

// Нечетные числа больше 5, умноженные на 2
var result2 = numbers
    .where((n) => n % 2 != 0)
    .where((n) => n > 5)
    .map((n) => n * 2)
    .toSet();
print('Результат: $result2'); // {14, 18}
```

### Пример 4: Фильтрация с функцией
```dart
bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

var numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

var primes = numbers.where(isPrime).toSet();
print('Простые числа: $primes'); // {2, 3, 5, 7, 11, 13}

var composites = numbers.where((n) => n > 1 && !isPrime(n)).toSet();
print('Составные числа: $composites'); // {4, 6, 8, 9, 10, 12, 14, 15}
```

### Пример 5: Статистика по фильтрам
```dart
var numbers = Set.from(List.generate(20, (i) => i + 1));

var even = numbers.where((n) => n % 2 == 0).toSet();
var odd = numbers.where((n) => n % 2 != 0).toSet();
var divisibleBy3 = numbers.where((n) => n % 3 == 0).toSet();

print('Всего чисел: ${numbers.length}');
print('Четных: ${even.length}');
print('Нечетных: ${odd.length}');
print('Кратных 3: ${divisibleBy3.length}');
print('');
print('Есть число > 15: ${numbers.any((n) => n > 15)}');
print('Все положительные: ${numbers.every((n) => n > 0)}');
print('Все < 30: ${numbers.every((n) => n < 30)}');
```
