# Подсказки к Задаче 5: Преобразование типов

## Краткое описание
В программировании часто нужно преобразовывать данные из одного типа в другой. В Dart есть специальные методы для конвертации между String, int и double.

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать строковые переменные с числами | `String strNumber = '42';` |
| 2 | Преобразовать String в int | `int.parse(строка)` |
| 3 | Преобразовать String в double | `double.parse(строка)` |
| 4 | Преобразовать int в String | `число.toString()` |
| 5 | Преобразовать int в double | `число.toDouble()` |
| 6 | Преобразовать double в int | `число.toInt()` |
| 7 | Вывести все результаты | Использовать `print()` |

## Синтаксис и примеры

### String → int и double

```dart
// Преобразование строки в целое число
String strAge = '25';
int age = int.parse(strAge);
print(age);  // 25 (тип int)

// Преобразование строки в дробное число
String strPrice = '99.99';
double price = double.parse(strPrice);
print(price);  // 99.99 (тип double)
```

### int/double → String

```dart
// Число в строку
int age = 30;
String strAge = age.toString();
print(strAge);  // '30' (тип String)

double price = 149.50;
String strPrice = price.toString();
print(strPrice);  // '149.5' (тип String)
```

### int ↔ double

```dart
// int в double
int whole = 10;
double decimal = whole.toDouble();
print(decimal);  // 10.0

// double в int (дробная часть отбрасывается!)
double pi = 3.14159;
int rounded = pi.toInt();
print(rounded);  // 3 (не 4!)
```

## Частые ошибки

1. **Попытка parse некорректной строки**
   ```dart
   String text = 'abc';
   int number = int.parse(text);  // ОШИБКА во время выполнения!

   // Правильно - проверить или использовать tryParse
   int? number = int.tryParse(text);  // Вернет null если не число
   ```

2. **Потеря точности при toInt()**
   ```dart
   double value = 9.8;
   int result = value.toInt();
   print(result);  // 9, а не 10! (не округляет, а отбрасывает)
   ```

3. **Путаница между parse и tryParse**
   ```dart
   // parse - выбросит ошибку если не число
   int a = int.parse('abc');  // Ошибка!

   // tryParse - вернет null если не число
   int? b = int.tryParse('abc');  // null
   ```

4. **Забыть точку перед методом**
   ```dart
   int age = 25;
   String str = toString(age);  // ОШИБКА!
   String str = age.toString();  // Правильно
   ```

## Дополнительные примеры

### Пример 1: Работа с вводом пользователя

```dart
// Представим, что пользователь ввел '25'
String userInput = '25';
int age = int.parse(userInput);
int nextAge = age + 1;
print('Через год вам будет $nextAge');
```

### Пример 2: Форматирование цен

```dart
double price = 1234.5;
String formattedPrice = price.toString();
print('Цена: $formattedPrice руб.');  // Цена: 1234.5 руб.
```

### Пример 3: Безопасный парсинг

```dart
String input = 'not a number';

// Небезопасно
// int value = int.parse(input);  // Ошибка!

// Безопасно
int? value = int.tryParse(input);
if (value == null) {
  print('Это не число!');
} else {
  print('Число: $value');
}
```

### Пример 4: Таблица преобразований

```dart
// Исходные данные
String str1 = '100';
String str2 = '3.14';
int num1 = 42;
double num2 = 2.71;

// Преобразования String → число
print('String -> int: ${int.parse(str1)}');      // 100
print('String -> double: ${double.parse(str2)}');  // 3.14

// Преобразования число → String
print('int -> String: ${num1.toString()}');      // '42'
print('double -> String: ${num2.toString()}');   // '2.71'

// Преобразования int ↔ double
print('int -> double: ${num1.toDouble()}');      // 42.0
print('double -> int: ${num2.toInt()}');         // 2
```

## Подсказка по отбрасыванию дробной части

Метод `toInt()` **не округляет**, а **отбрасывает** дробную часть:

```dart
print(9.1.toInt());  // 9
print(9.5.toInt());  // 9
print(9.9.toInt());  // 9
```

Если нужно округление, используйте `.round()`:

```dart
print(9.4.round());  // 9
print(9.5.round());  // 10
print(9.9.round());  // 10
```

## Подсказка по выводу

```dart
print('Исходные данные:');
print('strNumber (String): \'$strNumber\'');
print('strDouble (String): \'$strDouble\'');
print('');
print('После преобразования:');
print('число из strNumber (int): $интЧисло');
print('число из strDouble (double): $дробноеЧисло');
```
