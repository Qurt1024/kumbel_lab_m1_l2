# Подсказки к Задаче 7: Методы поиска и фильтрации

## Описание
Функциональные методы списков позволяют эффективно фильтровать и проверять данные по различным условиям.

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать список возрастов | `var ages = [15, 22, 18, ...]` |
| 2 | Фильтровать по условию | `ages.where((age) => age >= 18)` |
| 3 | Найти первый элемент | `ages.firstWhere((age) => age > 20)` |
| 4 | Проверить наличие | `ages.any((age) => age > 30)` |
| 5 | Проверить все элементы | `ages.every((age) => age > 10)` |

## Метод where() - фильтрация

```dart
var ages = [15, 22, 18, 30, 17, 25, 16, 35, 20];

// Найти все элементы, удовлетворяющие условию
var adults = ages.where((age) => age >= 18).toList();
print(adults);  // [22, 18, 30, 25, 35, 20]

var minors = ages.where((age) => age < 18).toList();
print(minors);  // [15, 17, 16]

// Подсчет количества
print('Совершеннолетних: ${adults.length}');
print('Несовершеннолетних: ${minors.length}');

// ВАЖНО: where() возвращает Iterable, нужен .toList()
```

## Метод firstWhere() - поиск первого

```dart
var ages = [15, 22, 18, 30, 17, 25];

// Найти первый элемент по условию
var firstAdult = ages.firstWhere((age) => age >= 18);
print(firstAdult);  // 22

var firstOver20 = ages.firstWhere((age) => age > 20);
print(firstOver20);  // 22

// С обработкой отсутствия элемента
var over40 = ages.firstWhere(
  (age) => age > 40,
  orElse: () => -1  // Вернет -1 если не найдено
);
print(over40);  // -1
```

## Метод any() - проверка наличия

```dart
var ages = [15, 22, 18, 30, 17, 25, 16, 35, 20];

// Проверить, есть ли хотя бы один элемент, удовлетворяющий условию
var hasOver30 = ages.any((age) => age > 30);
print('Есть возраст > 30: $hasOver30');  // true

var hasOver50 = ages.any((age) => age > 50);
print('Есть возраст > 50: $hasOver50');  // false

var hasMinors = ages.any((age) => age < 18);
print('Есть несовершеннолетние: $hasMinors');  // true
```

## Метод every() - проверка всех

```dart
var ages = [15, 22, 18, 30, 17, 25, 16, 35, 20];

// Проверить, что ВСЕ элементы удовлетворяют условию
var allOver10 = ages.every((age) => age > 10);
print('Все возрасты > 10: $allOver10');  // true

var allAdults = ages.every((age) => age >= 18);
print('Все совершеннолетние: $allAdults');  // false

var allUnder100 = ages.every((age) => age < 100);
print('Все младше 100: $allUnder100');  // true
```

## Комбинирование методов

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Найти все четные числа
var even = numbers.where((n) => n % 2 == 0).toList();
print('Четные: $even');  // [2, 4, 6, 8, 10]

// Найти все нечетные числа больше 5
var oddOver5 = numbers
    .where((n) => n % 2 != 0)
    .where((n) => n > 5)
    .toList();
print('Нечетные > 5: $oddOver5');  // [7, 9]

// Проверить условия
var hasEven = numbers.any((n) => n % 2 == 0);
var allPositive = numbers.every((n) => n > 0);
print('Есть четные: $hasEven');      // true
print('Все положительные: $allPositive');  // true
```

## Частые ошибки

1. **Забыли .toList() после where()**
   ```dart
   var ages = [15, 22, 18];
   var adults = ages.where((age) => age >= 18);  // Это Iterable!
   print(adults.length);  // Работает, но лучше преобразовать

   // Правильно
   var adults = ages.where((age) => age >= 18).toList();
   ```

2. **Не обработали отсутствие элемента в firstWhere()**
   ```dart
   var ages = [15, 17, 16];
   var adult = ages.firstWhere((age) => age >= 18);  // ОШИБКА!

   // Правильно
   var adult = ages.firstWhere(
     (age) => age >= 18,
     orElse: () => -1
   );
   ```

3. **Перепутали any() и every()**
   ```dart
   var ages = [15, 22, 18];

   // any() - хотя бы один
   print(ages.any((age) => age >= 18));  // true (есть 22 и 18)

   // every() - все элементы
   print(ages.every((age) => age >= 18));  // false (15 < 18)
   ```

## Дополнительные примеры

```dart
var scores = [45, 78, 92, 65, 88, 54, 73];

print('Все оценки: $scores');

// Фильтрация
var passed = scores.where((s) => s >= 60).toList();
var failed = scores.where((s) => s < 60).toList();

print('Сдали (>= 60): $passed');
print('Не сдали (< 60): $failed');

// Поиск
var firstExcellent = scores.firstWhere(
  (s) => s >= 90,
  orElse: () => -1
);
print('Первая отличная оценка: $firstExcellent');

// Проверки
var hasExcellent = scores.any((s) => s >= 90);
var allPassed = scores.every((s) => s >= 60);

print('Есть отличные оценки: $hasExcellent');
print('Все сдали: $allPassed');

// Статистика
print('Сдало: ${passed.length} человек');
print('Не сдало: ${failed.length} человек');
```

## Практическое применение

```dart
// Фильтрация товаров по цене
var prices = [100, 250, 75, 300, 150, 50, 400];

var affordable = prices.where((p) => p <= 200).toList();
var expensive = prices.where((p) => p > 200).toList();

print('Доступные товары: $affordable');
print('Дорогие товары: $expensive');

// Проверки
var hasCheap = prices.any((p) => p < 100);
var allExpensive = prices.every((p) => p > 100);

print('Есть дешевые (< 100): $hasCheap');
print('Все дорогие (> 100): $allExpensive');
```

## Сложные условия

```dart
var ages = [15, 22, 18, 30, 17, 25, 16, 35, 20];

// Несколько условий
var youngAdults = ages
    .where((age) => age >= 18 && age < 25)
    .toList();
print('Молодые взрослые (18-24): $youngAdults');

// Логические операторы
var teenagers = ages
    .where((age) => age >= 13 && age < 20)
    .toList();
print('Подростки (13-19): $teenagers');
```

## Полезная информация

- `where(condition)` - возвращает все элементы по условию (Iterable)
- `firstWhere(condition)` - возвращает первый элемент по условию
- `any(condition)` - true если хотя бы один элемент подходит
- `every(condition)` - true если все элементы подходят
- Всегда используйте `.toList()` после `where()`
- В `firstWhere()` используйте `orElse` для безопасности
- Можно комбинировать несколько условий через `&&` и `||`
