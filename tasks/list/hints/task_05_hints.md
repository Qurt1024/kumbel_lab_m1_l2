# Подсказки к Задаче 5: Работа с методами списков

## Описание
Списки имеют множество встроенных методов для работы с данными: получение первого/последнего элемента, разворот, сортировка.

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать список чисел | `var numbers = [5, 2, 8, ...]` |
| 2 | Получить first и last | `numbers.first`, `numbers.last` |
| 3 | Развернуть список | `numbers.reversed.toList()` |
| 4 | Отсортировать по возрастанию | `numbers.sort()` |
| 5 | Отсортировать по убыванию | `list.sort((a, b) => b.compareTo(a))` |
| 6 | Найти min/max | Использовать sorted список |

## Свойства first и last

```dart
var numbers = [5, 2, 8, 1, 9];

// Первый элемент
print(numbers.first);  // 5 (то же что numbers[0])

// Последний элемент
print(numbers.last);   // 9 (то же что numbers[numbers.length - 1])

// Безопасное использование
if (numbers.isNotEmpty) {
  print('Первый: ${numbers.first}');
  print('Последний: ${numbers.last}');
}
```

## Разворот списка

```dart
var original = [1, 2, 3, 4, 5];

// reversed возвращает Iterable, нужно преобразовать в List
var reversed = original.reversed.toList();

print('Исходный: $original');    // [1, 2, 3, 4, 5]
print('Развернутый: $reversed'); // [5, 4, 3, 2, 1]

// Исходный список не изменяется
print('Original все еще: $original');  // [1, 2, 3, 4, 5]
```

## Сортировка списков

```dart
var numbers = [5, 2, 8, 1, 9, 3];

// Сортировка по возрастанию (изменяет исходный список!)
numbers.sort();
print(numbers);  // [1, 2, 3, 5, 8, 9]

// Сортировка по убыванию
numbers.sort((a, b) => b.compareTo(a));
print(numbers);  // [9, 8, 5, 3, 2, 1]

// Сортировка строк
var words = ['банан', 'яблоко', 'апельсин'];
words.sort();
print(words);  // [апельсин, банан, яблоко] - по алфавиту
```

## Создание копии списка

```dart
var original = [5, 2, 8, 1, 9];

// Способ 1: List.from()
var copy1 = List.from(original);

// Способ 2: toList()
var copy2 = original.toList();

// Способ 3: spread operator
var copy3 = [...original];

// Теперь можно сортировать копию
copy1.sort();  // Сортируем копию
print('Original: $original');  // [5, 2, 8, 1, 9] - не изменился
print('Copy: $copy1');         // [1, 2, 5, 8, 9] - отсортирован
```

## Поиск минимума и максимума

```dart
var numbers = [5, 2, 8, 1, 9, 3];

// Способ 1: Сортировка
var sorted = List.from(numbers);
sorted.sort();
var min = sorted.first;
var max = sorted.last;

// Способ 2: Reduce (для продвинутых)
var min2 = numbers.reduce((a, b) => a < b ? a : b);
var max2 = numbers.reduce((a, b) => a > b ? a : b);

print('Минимум: $min');
print('Максимум: $max');
```

## Частые ошибки

1. **Забыли преобразовать reversed в список**
   ```dart
   var numbers = [1, 2, 3];
   var reversed = numbers.reversed;  // Это Iterable, не List!

   // Правильно
   var reversed = numbers.reversed.toList();
   ```

2. **sort() изменяет исходный список**
   ```dart
   var numbers = [5, 2, 8];
   numbers.sort();  // numbers теперь [2, 5, 8]

   // Если нужно сохранить оригинал - создайте копию
   var original = [5, 2, 8];
   var sorted = List.from(original);
   sorted.sort();
   ```

3. **Использование first/last на пустом списке**
   ```dart
   var empty = <int>[];
   print(empty.first);  // ОШИБКА! Список пустой

   // Правильно
   if (empty.isNotEmpty) {
     print(empty.first);
   }
   ```

4. **Неправильная сортировка по убыванию**
   ```dart
   // Неправильно
   numbers.sort();
   numbers.reversed;  // Это не изменит список!

   // Правильно
   numbers.sort((a, b) => b.compareTo(a));
   ```

## Дополнительные примеры

```dart
// Работа с оценками
var grades = [4, 5, 3, 5, 4, 5];

print('Первая оценка: ${grades.first}');
print('Последняя оценка: ${grades.last}');

// Развернуть порядок
var reversed = grades.reversed.toList();
print('В обратном порядке: $reversed');

// Сортировка
var sorted = List.from(grades);
sorted.sort();
print('По возрастанию: $sorted');

// Статистика
print('Минимальная оценка: ${sorted.first}');
print('Максимальная оценка: ${sorted.last}');
```

## Комбинирование методов

```dart
var numbers = [5, 2, 8, 1, 9, 3, 7, 4, 6];

// Анализ данных
print('Исходные числа: $numbers');
print('Первое число: ${numbers.first}');
print('Последнее число: ${numbers.last}');

// Создаем разные версии
var ascending = List.from(numbers)..sort();
var descending = List.from(numbers)..sort((a, b) => b.compareTo(a));
var reversed = numbers.reversed.toList();

print('По возрастанию: $ascending');
print('По убыванию: $descending');
print('Развернутый: $reversed');

// Статистика
print('Минимум: ${ascending.first}');
print('Максимум: ${ascending.last}');
print('Медиана: ${ascending[ascending.length ~/ 2]}');
```

## Каскадная нотация (..)

```dart
// Несколько операций подряд
var numbers = [5, 2, 8, 1, 9];
var result = List.from(numbers)
  ..sort()
  ..add(10);

print(result);  // [1, 2, 5, 8, 9, 10]
```

## Полезная информация

- `first` и `last` - свойства, не методы (без скобок)
- `reversed` возвращает Iterable, нужен `.toList()`
- `sort()` изменяет исходный список
- Для сохранения оригинала создавайте копию через `List.from()`
- Сортировка по убыванию: `(a, b) => b.compareTo(a)`
- После сортировки: first - минимум, last - максимум
