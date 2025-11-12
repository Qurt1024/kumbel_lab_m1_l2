# Подсказки к Задаче 8: Операции с подсписками

## Описание
Dart предоставляет методы для извлечения частей списка: sublist(), take(), skip() и getRange().

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать список | `var alphabet = ['A', 'B', ...]` |
| 2 | Получить подсписок | `alphabet.sublist(2, 6)` |
| 3 | Взять первые n элементов | `alphabet.take(3).toList()` |
| 4 | Пропустить n элементов | `alphabet.skip(5).toList()` |
| 5 | Разделить на части | Комбинация методов |

## Метод sublist() - извлечение подсписка

```dart
var alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

// sublist(start, end) - от start до end (не включая end)
var part1 = alphabet.sublist(2, 5);
print(part1);  // [C, D, E] - индексы 2, 3, 4

var part2 = alphabet.sublist(0, 3);
print(part2);  // [A, B, C] - индексы 0, 1, 2

// Без указания end - до конца списка
var part3 = alphabet.sublist(5);
print(part3);  // [F, G, H] - от индекса 5 до конца

// Копия всего списка
var copy = alphabet.sublist(0);
print(copy);  // [A, B, C, D, E, F, G, H]
```

## Метод take() - взять первые n элементов

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Взять первые 3 элемента
var first3 = numbers.take(3).toList();
print(first3);  // [1, 2, 3]

// Взять первые 5 элементов
var first5 = numbers.take(5).toList();
print(first5);  // [1, 2, 3, 4, 5]

// Если запросить больше чем есть - вернет все
var all = numbers.take(100).toList();
print(all.length);  // 10 (все что есть)

// ВАЖНО: take() возвращает Iterable, нужен .toList()
```

## Метод skip() - пропустить первые n элементов

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Пропустить первые 3 элемента
var after3 = numbers.skip(3).toList();
print(after3);  // [4, 5, 6, 7, 8, 9, 10]

// Пропустить первые 7 элементов
var after7 = numbers.skip(7).toList();
print(after7);  // [8, 9, 10]

// Если пропустить больше чем есть - вернет пустой список
var empty = numbers.skip(100).toList();
print(empty);  // []

// ВАЖНО: skip() возвращает Iterable, нужен .toList()
```

## Метод getRange() - получить диапазон

```dart
var letters = ['A', 'B', 'C', 'D', 'E', 'F'];

// getRange(start, end) - похож на sublist
var range = letters.getRange(1, 4).toList();
print(range);  // [B, C, D] - индексы 1, 2, 3

// getRange возвращает Iterable, нужен .toList()
```

## Разделение списка на части

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Начало (элементы 1-3)
var beginning = numbers.sublist(0, 3);
print('Начало: $beginning');  // [1, 2, 3]

// Середина (элементы 4-7)
var middle = numbers.sublist(3, 7);
print('Середина: $middle');  // [4, 5, 6, 7]

// Конец (элементы 8-10)
var end = numbers.sublist(7);
print('Конец: $end');  // [8, 9, 10]

// Альтернатива с take/skip
var beginning2 = numbers.take(3).toList();
var middle2 = numbers.skip(3).take(4).toList();
var end2 = numbers.skip(7).toList();
```

## Комбинирование методов

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Пропустить первые 2, взять следующие 3
var result1 = numbers.skip(2).take(3).toList();
print(result1);  // [3, 4, 5]

// Взять первые 7, пропустить 2 из них
var result2 = numbers.take(7).skip(2).toList();
print(result2);  // [3, 4, 5, 6, 7]

// Пропустить первые и последние элементы
var middle = numbers.skip(1).take(numbers.length - 2).toList();
print(middle);  // [2, 3, 4, 5, 6, 7, 8, 9]
```

## Частые ошибки

1. **Забыли, что end не включается**
   ```dart
   var list = ['A', 'B', 'C', 'D', 'E'];
   var sub = list.sublist(1, 3);
   print(sub);  // [B, C] - не включает индекс 3!

   // Для получения элементов с индексами 1, 2, 3:
   var sub = list.sublist(1, 4);
   ```

2. **Выход за границы списка**
   ```dart
   var list = ['A', 'B', 'C'];
   var sub = list.sublist(1, 10);  // ОШИБКА! Индекс 10 не существует

   // Правильно - используйте длину списка
   var sub = list.sublist(1);  // До конца
   ```

3. **Забыли .toList() после take/skip**
   ```dart
   var numbers = [1, 2, 3, 4, 5];
   var first = numbers.take(3);  // Это Iterable, не List

   // Правильно
   var first = numbers.take(3).toList();
   ```

4. **Неправильный порядок при комбинировании**
   ```dart
   var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

   // Неправильно - сначала take, потом skip
   var wrong = numbers.take(5).skip(2).toList();  // [3, 4, 5]

   // Правильно - сначала skip, потом take
   var right = numbers.skip(2).take(5).toList();  // [3, 4, 5, 6, 7]
   ```

## Дополнительные примеры

```dart
// Работа с алфавитом
var alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

print('Весь алфавит: $alphabet');

// Различные части
var firstThree = alphabet.take(3).toList();
print('Первые 3 буквы: $firstThree');

var lastThree = alphabet.skip(alphabet.length - 3).toList();
print('Последние 3 буквы: $lastThree');

var middle = alphabet.sublist(3, 7);
print('Средние буквы (3-6): $middle');

// Четные позиции
var evenPositions = <String>[];
for (var i = 0; i < alphabet.length; i += 2) {
  evenPositions.add(alphabet[i]);
}
print('Четные позиции: $evenPositions');
```

## Практическое применение

```dart
// Пагинация (постраничный вывод)
var items = List.generate(100, (i) => 'Item ${i + 1}');

int pageSize = 10;
int pageNumber = 2;  // Вторая страница

var page = items
    .skip(pageNumber * pageSize)
    .take(pageSize)
    .toList();

print('Страница ${pageNumber + 1}: $page');

// Разделение на группы
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
var groupSize = 3;

for (var i = 0; i < numbers.length; i += groupSize) {
  var group = numbers.skip(i).take(groupSize).toList();
  print('Группа ${i ~/ groupSize + 1}: $group');
}
```

## Сравнение методов

```dart
var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// sublist - возвращает List
var sub1 = list.sublist(2, 5);  // [3, 4, 5]

// take/skip - возвращают Iterable
var sub2 = list.skip(2).take(3).toList();  // [3, 4, 5]

// getRange - возвращает Iterable
var sub3 = list.getRange(2, 5).toList();  // [3, 4, 5]

// Все три дают одинаковый результат!
```

## Полезная информация

- `sublist(start, end)` - от start до end (не включая end)
- `sublist(start)` - от start до конца списка
- `take(n)` - первые n элементов (возвращает Iterable)
- `skip(n)` - пропустить первые n элементов (возвращает Iterable)
- `getRange(start, end)` - аналог sublist (возвращает Iterable)
- При комбинировании: сначала skip, потом take
- Всегда добавляйте `.toList()` после take/skip/getRange
