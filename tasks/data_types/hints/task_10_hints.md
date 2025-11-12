# Подсказки к Задаче 10: Object и приведение типов

## Краткое описание
Object - это базовый тип для всех объектов в Dart. Любое значение является Object. Приведение типов позволяет преобразовать Object к конкретному типу используя операторы 'as' (приведение) и 'is' (проверка).

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать Object переменные | `Object item1 = 'Привет';` |
| 2 | Создать Object с разными типами | String, int, double, bool |
| 3 | Проверить тип переменной | `if (item is String)` |
| 4 | Привести к конкретному типу | `String text = item as String;` |
| 5 | Выполнить операции для каждого типа | length, умножение, округление, инверсия |
| 6 | Попробовать неправильное приведение | Закомментировать! |
| 7 | Вывести результаты | Использовать `print()` |

## Синтаксис и примеры

### Объявление Object переменных

```dart
// Object может хранить любой тип
Object value1 = 'Текст';      // String
Object value2 = 42;           // int
Object value3 = 3.14;         // double
Object value4 = true;         // bool
Object value5 = [1, 2, 3];    // List
```

### Проверка типа с is

```dart
Object value = 'Привет';

// Проверка типа
if (value is String) {
  print('Это строка');
}

if (value is int) {
  print('Это целое число');
}

// Проверка с использованием значения
if (value is String) {
  // Внутри блока Dart знает, что value - это String
  print('Длина: ${value.length}');
}
```

### Приведение типа с as

```dart
Object value = 'Привет';

// Приведение к конкретному типу
String text = value as String;
print(text.length);  // 6

// Если тип неправильный - ошибка!
Object number = 42;
// String wrongText = number as String;  // ОШИБКА во время выполнения!
```

### Безопасное приведение

```dart
Object value = 'Привет';

// Сначала проверить, потом привести
if (value is String) {
  String text = value as String;
  print('Длина: ${text.length}');
}

// Или просто проверить и использовать
if (value is String) {
  // Dart автоматически понимает тип внутри if
  print('Длина: ${value.length}');
}
```

## Частые ошибки

1. **Приведение без проверки**
   ```dart
   Object value = 42;
   String text = value as String;  // ОШИБКА! value это int, не String

   // Правильно - сначала проверить
   if (value is String) {
     String text = value as String;
   }
   ```

2. **Путаница между is и as**
   ```dart
   Object value = 'Привет';

   // is - ПРОВЕРЯЕТ тип (возвращает bool)
   bool isString = value is String;  // true

   // as - ПРИВОДИТ к типу (возвращает значение этого типа)
   String text = value as String;  // 'Привет'
   ```

3. **Забыть, что Object не имеет методов типа**
   ```dart
   Object text = 'Привет';
   // print(text.length);  // ОШИБКА! Компилятор не знает, что это String

   // Правильно
   if (text is String) {
     print(text.length);  // OK
   }
   ```

4. **Использовать as там, где достаточно is**
   ```dart
   Object value = 'Привет';

   // Избыточно
   if (value is String) {
     String text = value as String;
     print(text.length);
   }

   // Лучше - Dart автоматически понимает тип
   if (value is String) {
     print(value.length);  // value уже понимается как String
   }
   ```

## Дополнительные примеры

### Пример 1: Обработка разных типов

```dart
void processValue(Object value) {
  if (value is String) {
    print('Строка: "$value", длина: ${value.length}');
  } else if (value is int) {
    print('Целое число: $value, удвоенное: ${value * 2}');
  } else if (value is double) {
    print('Дробное число: $value, округленное: ${value.round()}');
  } else if (value is bool) {
    print('Логическое: $value, инверсия: ${!value}');
  } else {
    print('Неизвестный тип: ${value.runtimeType}');
  }
}

processValue('Привет');   // Строка
processValue(42);         // Целое число
processValue(3.14);       // Дробное число
processValue(true);       // Логическое
```

### Пример 2: Безопасное приведение

```dart
Object item1 = 'Привет';
Object item2 = 42;

// Проверка и приведение для item1
if (item1 is String) {
  String text = item1 as String;
  print('Текст в верхнем регистре: ${text.toUpperCase()}');
}

// Попытка неправильного приведения (закомментировано!)
// if (item2 is String) {
//   String text = item2 as String;  // Никогда не выполнится
// }
// String wrongText = item2 as String;  // ОШИБКА!
```

### Пример 3: Работа со списком Object

```dart
List<Object> items = ['Текст', 42, 3.14, true];

for (var item in items) {
  print('\nЗначение: $item');
  print('Тип: ${item.runtimeType}');

  if (item is String) {
    print('Операция: длина = ${item.length}');
  } else if (item is int) {
    print('Операция: умножить на 2 = ${item * 2}');
  } else if (item is double) {
    print('Операция: округлить = ${item.round()}');
  } else if (item is bool) {
    print('Операция: инвертировать = ${!item}');
  }
}
```

### Пример 4: Smart cast в условиях

```dart
Object value = 'Привет';

// После проверки is, Dart автоматически знает тип
if (value is String) {
  // Здесь value автоматически String, не нужен as!
  print(value.length);
  print(value.toUpperCase());
  print(value.toLowerCase());
}
```

## Разница между is и as

| Оператор | Что делает | Возвращает | Пример |
|----------|-----------|------------|--------|
| `is` | Проверяет тип | `bool` | `value is String` → `true/false` |
| `as` | Приводит к типу | Значение нового типа | `value as String` → String |

### is - проверка типа

```dart
Object value = 'Привет';

// is возвращает bool
bool isString = value is String;  // true
bool isInt = value is int;        // false

if (value is String) {
  print('Это строка!');
}
```

### as - приведение типа

```dart
Object value = 'Привет';

// as возвращает значение указанного типа
String text = value as String;  // 'Привет'
print(text.length);  // 6

// Если тип не совпадает - ошибка!
Object number = 42;
// String wrong = number as String;  // ОШИБКА во время выполнения!
```

## Методы для разных типов

```dart
// String методы
String text = 'привет';
text.length;           // длина
text.toUpperCase();    // 'ПРИВЕТ'
text.toLowerCase();    // 'привет'

// int методы
int number = 10;
number * 2;            // 20
number.toDouble();     // 10.0
number.toString();     // '10'

// double методы
double decimal = 3.14;
decimal.round();       // 3
decimal.floor();       // 3
decimal.ceil();        // 4
decimal.toInt();       // 3

// bool операции
bool flag = true;
!flag;                 // false
```

## Иерархия типов

```
Object (базовый тип для всех)
  ↓
num
  ↓
int, double

Object
  ↓
String

Object
  ↓
bool
```

Все является Object!

## Безопасные паттерны

### Паттерн 1: Проверка перед приведением

```dart
Object value = getValueFromSomewhere();

if (value is String) {
  String text = value as String;  // Безопасно
  // работаем с text
}
```

### Паттерн 2: Использование smart cast

```dart
Object value = getValueFromSomewhere();

if (value is String) {
  // as не нужен! Dart знает, что это String
  print(value.length);
}
```

### Паттерн 3: Type switch

```dart
void handleValue(Object value) {
  if (value is String) {
    // обработка String
  } else if (value is int) {
    // обработка int
  } else if (value is double) {
    // обработка double
  } else if (value is bool) {
    // обработка bool
  }
}
```

## Вопрос для размышления

**В чем разница между 'is' и 'as'?**

Подумайте о:
- `is` проверяет и возвращает true/false
- `as` приводит тип и может вызвать ошибку
- `is` безопасен, `as` может быть опасен
- После `is` в блоке if Dart знает тип автоматически
