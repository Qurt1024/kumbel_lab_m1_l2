# Подсказки к Задаче 7: Тип данных num

## Краткое описание
num - это общий (родительский) тип для int и double. Когда переменная может быть как целым, так и дробным числом, используется тип num. Это делает код более гибким.

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать num переменные | `num temperature = 36.6;` |
| 2 | Создать еще num переменные | `num age = 25;` и `num score = 100;` |
| 3 | Вычислить сумму | Сложить все три переменные |
| 4 | Вычислить среднее | Разделить сумму на количество |
| 5 | Проверить типы переменных | Использовать `is int` и `is double` |
| 6 | Вывести результаты с типами | Использовать `print()` |

## Синтаксис и примеры

### Объявление num переменных

```dart
// num может хранить и int, и double
num value1 = 42;        // int
num value2 = 3.14;      // double
num value3 = 100;       // int

print(value1);  // 42
print(value2);  // 3.14
```

### Проверка типа с is

```dart
num value1 = 42;
num value2 = 3.14;

// Проверка является ли переменная int
print(value1 is int);     // true
print(value2 is int);     // false

// Проверка является ли переменная double
print(value1 is double);  // false
print(value2 is double);  // true

// Проверка является ли переменная num
print(value1 is num);     // true (int это подтип num)
print(value2 is num);     // true (double это подтип num)
```

### Операции с num

```dart
num a = 10;       // int
num b = 5.5;      // double

// Операции работают как обычно
num sum = a + b;        // 15.5 (double)
num product = a * 2;    // 20 (int)
num division = a / 2;   // 5.0 (double)

print(sum);      // 15.5
print(product);  // 20
print(division); // 5.0
```

## Частые ошибки

1. **Путаница между num, int и double**
   ```dart
   // Все это корректно
   num n1 = 10;      // num может хранить int
   num n2 = 10.5;    // num может хранить double

   // А это нет
   int i = 10.5;     // ОШИБКА! int не может хранить дробные
   double d = 10;    // OK (автоматически преобразуется в 10.0)
   ```

2. **Неправильная проверка типа**
   ```dart
   num value = 42;

   // Неправильно
   if (value == int) { }  // ОШИБКА!

   // Правильно
   if (value is int) { }
   ```

3. **Забыть, что результат может измениться**
   ```dart
   num a = 10;  // int
   num b = 3;   // int
   num c = a / b;  // 3.3333... (double!)

   print(c is int);     // false
   print(c is double);  // true
   ```

## Дополнительные примеры

### Пример 1: Иерархия типов

```dart
int integer = 10;
double decimal = 3.14;
num number1 = integer;   // OK
num number2 = decimal;   // OK

print(integer is num);   // true (int - это num)
print(decimal is num);   // true (double - это num)
print(integer is int);   // true
print(decimal is double);// true
```

### Пример 2: Работа с разными типами

```dart
num temp1 = 36.6;  // double
num temp2 = 37;    // int
num temp3 = 35.8;  // double

num average = (temp1 + temp2 + temp3) / 3;
print('Средняя температура: $average');

// Проверка типов
print('temp1 (36.6) это double: ${temp1 is double}');
print('temp2 (37) это int: ${temp2 is int}');
```

### Пример 3: Когда использовать num

```dart
// Функция, которая принимает любое число
num calculateSquare(num value) {
  return value * value;
}

// Работает и с int, и с double
print(calculateSquare(5));      // 25
print(calculateSquare(2.5));    // 6.25
```

### Пример 4: Проверка всех типов

```dart
num value = 42;

print('Значение: $value');
print('Тип во время выполнения: ${value.runtimeType}');
print('Это num? ${value is num}');
print('Это int? ${value is int}');
print('Это double? ${value is double}');
```

## Подсказка по определению типа

```dart
num checkType(num value) {
  if (value is int) {
    print('$value - это целое число (int)');
  } else if (value is double) {
    print('$value - это дробное число (double)');
  }
  return value;
}

checkType(42);     // 42 - это целое число (int)
checkType(3.14);   // 3.14 - это дробное число (double)
```

## Когда использовать num

| Тип | Когда использовать |
|-----|-------------------|
| `int` | Когда нужны только целые числа (счетчики, индексы) |
| `double` | Когда нужны дробные числа (цены, измерения) |
| `num` | Когда переменная может быть любым числом |

## Подсказка по выводу

```dart
print('Исходные данные:');
print('temperature: $temperature (это ${temperature is int ? 'int' : 'double'})');
print('age: $age (это ${age is int ? 'int' : 'double'})');
print('score: $score (это ${score is int ? 'int' : 'double'})');
print('');
print('Вычисления:');
print('Сумма: $sum');
print('Среднее: $average');
print('');
print('Проверка типов:');
print('temperature является double: ${temperature is double}');
print('temperature является int: ${temperature is int}');
```

## Важная информация

- `num` - это базовый тип для чисел
- `int` и `double` - это подтипы `num`
- Любой `int` является `num`
- Любой `double` является `num`
- Но не любой `num` является `int` или `double`!
