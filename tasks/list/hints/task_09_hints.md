# Подсказки к Задаче 9: Трансформация списков с map() и fold()

## Описание
Функциональные методы map() и fold() позволяют преобразовывать и сворачивать списки в новые структуры данных.

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Преобразовать каждый элемент | `list.map((item) => item * 0.8)` |
| 2 | Свернуть список к значению | `list.fold(0, (sum, item) => sum + item)` |
| 3 | Работа со строками | `name[0].toUpperCase() + name.substring(1)` |
| 4 | Математические операции | `number * number` |
| 5 | Вывести результаты | `.toList()` для map |

## Метод map() - преобразование элементов

```dart
var numbers = [1, 2, 3, 4, 5];

// Умножить каждое число на 2
var doubled = numbers.map((n) => n * 2).toList();
print(doubled);  // [2, 4, 6, 8, 10]

// Возвести в квадрат
var squared = numbers.map((n) => n * n).toList();
print(squared);  // [1, 4, 9, 16, 25]

// Преобразовать в строки
var strings = numbers.map((n) => 'Число: $n').toList();
print(strings);  // [Число: 1, Число: 2, ...]

// ВАЖНО: map() возвращает Iterable, нужен .toList()
```

## Метод fold() - свертка списка

```dart
var numbers = [1, 2, 3, 4, 5];

// Сумма всех элементов
var sum = numbers.fold(0, (total, item) => total + item);
print('Сумма: $sum');  // 15

// Произведение всех элементов
var product = numbers.fold(1, (total, item) => total * item);
print('Произведение: $product');  // 120

// Максимальное значение
var max = numbers.fold(numbers[0], (max, item) => item > max ? item : max);
print('Максимум: $max');  // 5
```

## Применение скидки к ценам

```dart
var prices = [100.0, 250.0, 75.0, 300.0, 150.0];

// Применить скидку 20% (оставить 80%)
var discounted = prices.map((price) => price * 0.8).toList();
print('Исходные цены: $prices');
print('Со скидкой 20%: $discounted');

// Вычислить общую сумму со скидкой
var total = discounted.fold(0.0, (sum, price) => sum + price);
print('Общая сумма: $total');

// Или в одну строку
var totalDirect = prices
    .map((price) => price * 0.8)
    .fold(0.0, (sum, price) => sum + price);
```

## Работа со строками

```dart
var names = ['иван', 'мария', 'петр'];

// Сделать первую букву заглавной
var capitalized = names.map((name) {
  return name[0].toUpperCase() + name.substring(1);
}).toList();

print('Исходные: $names');
print('С заглавной: $capitalized');  // [Иван, Мария, Петр]

// Короткий вариант
var capitalized2 = names
    .map((n) => n[0].toUpperCase() + n.substring(1))
    .toList();
```

## Математические преобразования

```dart
var numbers = [1, 2, 3, 4, 5];

// Квадраты чисел
var squares = numbers.map((n) => n * n).toList();
print('Числа: $numbers');
print('Квадраты: $squares');  // [1, 4, 9, 16, 25]

// Кубы чисел
var cubes = numbers.map((n) => n * n * n).toList();
print('Кубы: $cubes');  // [1, 8, 27, 64, 125]

// Удвоенные числа
var doubled = numbers.map((n) => n * 2).toList();
print('Удвоенные: $doubled');  // [2, 4, 6, 8, 10]
```

## Произведение всех чисел

```dart
var numbers = [1, 2, 3, 4, 5];

// Вычислить произведение с помощью fold
var product = numbers.fold(1, (result, item) => result * item);
print('Числа: $numbers');
print('Произведение: $product');  // 120

// Пошаговое объяснение:
// Шаг 1: result = 1, item = 1 -> 1 * 1 = 1
// Шаг 2: result = 1, item = 2 -> 1 * 2 = 2
// Шаг 3: result = 2, item = 3 -> 2 * 3 = 6
// Шаг 4: result = 6, item = 4 -> 6 * 4 = 24
// Шаг 5: result = 24, item = 5 -> 24 * 5 = 120
```

## Понимание fold()

```dart
// Синтаксис: list.fold(начальноеЗначение, (аккумулятор, элемент) => операция)

var numbers = [10, 20, 30];

// Сумма (начинаем с 0)
var sum = numbers.fold(0, (acc, item) {
  print('Аккумулятор: $acc, Элемент: $item, Результат: ${acc + item}');
  return acc + item;
});
// Вывод:
// Аккумулятор: 0, Элемент: 10, Результат: 10
// Аккумулятор: 10, Элемент: 20, Результат: 30
// Аккумулятор: 30, Элемент: 30, Результат: 60

// Произведение (начинаем с 1)
var product = numbers.fold(1, (acc, item) => acc * item);
```

## Частые ошибки

1. **Забыли .toList() после map()**
   ```dart
   var numbers = [1, 2, 3];
   var doubled = numbers.map((n) => n * 2);  // Это Iterable!

   // Правильно
   var doubled = numbers.map((n) => n * 2).toList();
   ```

2. **Неправильное начальное значение в fold()**
   ```dart
   // Неправильно - начинаем с 0 для произведения
   var product = [2, 3, 4].fold(0, (acc, item) => acc * item);
   print(product);  // 0 (всегда будет 0!)

   // Правильно - начинаем с 1
   var product = [2, 3, 4].fold(1, (acc, item) => acc * item);
   print(product);  // 24
   ```

3. **Неправильный синтаксис обработки строк**
   ```dart
   var name = 'иван';
   var capitalized = name.toUpperCase()[0] + name.substring(1);  // ОШИБКА!

   // Правильно
   var capitalized = name[0].toUpperCase() + name.substring(1);
   ```

4. **Путаница между map и forEach**
   ```dart
   // forEach не возвращает новый список
   var result = [1, 2, 3].forEach((n) => n * 2);  // void!

   // Правильно - используйте map
   var result = [1, 2, 3].map((n) => n * 2).toList();
   ```

## Дополнительные примеры

```dart
// Конвертация температур (Цельсий в Фаренгейт)
var celsius = [0, 10, 20, 30, 40];
var fahrenheit = celsius.map((c) => c * 9 / 5 + 32).toList();
print('Цельсий: $celsius');
print('Фаренгейт: $fahrenheit');

// Добавление процентов
var amounts = [100, 200, 300];
var withTax = amounts.map((amount) => amount * 1.2).toList();
print('Без налога: $amounts');
print('С налогом 20%: $withTax');

// Форматирование строк
var prices = [19.99, 29.99, 39.99];
var formatted = prices.map((p) => '\$$p').toList();
print('Форматированные цены: $formatted');
```

## Комбинирование map и fold

```dart
var numbers = [1, 2, 3, 4, 5];

// Удвоить каждое число и найти сумму
var sum = numbers
    .map((n) => n * 2)
    .fold(0, (acc, item) => acc + item);
print('Сумма удвоенных: $sum');  // 30

// Возвести в квадрат и найти произведение
var product = numbers
    .map((n) => n * n)
    .fold(1, (acc, item) => acc * item);
print('Произведение квадратов: $product');
```

## Практические применения

```dart
// Обработка корзины покупок
var cart = [
  {'name': 'Товар 1', 'price': 100.0, 'quantity': 2},
  {'name': 'Товар 2', 'price': 50.0, 'quantity': 3},
  {'name': 'Товар 3', 'price': 75.0, 'quantity': 1},
];

// Вычислить стоимость каждого товара
var itemTotals = cart.map((item) {
  return item['price'] * item['quantity'];
}).toList();

// Общая сумма
var total = itemTotals.fold(0.0, (sum, item) => sum + item);
print('Общая сумма: $total');
```

## Reduce vs Fold

```dart
var numbers = [1, 2, 3, 4, 5];

// fold - нужно начальное значение
var sum1 = numbers.fold(0, (acc, item) => acc + item);

// reduce - использует первый элемент как начальное значение
var sum2 = numbers.reduce((acc, item) => acc + item);

print('fold: $sum1');    // 15
print('reduce: $sum2');  // 15

// Разница: fold работает с пустыми списками, reduce - нет
var empty = <int>[];
var foldResult = empty.fold(0, (acc, item) => acc + item);  // 0
// var reduceResult = empty.reduce((acc, item) => acc + item);  // ОШИБКА!
```

## Полезная информация

- `map(transformation)` - преобразует каждый элемент списка
- `fold(initial, combine)` - сворачивает список к одному значению
- `map()` возвращает Iterable, нужен `.toList()`
- `fold()` принимает начальное значение и функцию комбинирования
- Для суммы начальное значение = 0
- Для произведения начальное значение = 1
- Можно комбинировать map() и fold() в цепочку
