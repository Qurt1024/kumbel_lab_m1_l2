# Подсказки к Задаче 9: Динамический тип dynamic

## Краткое описание
dynamic - это специальный тип в Dart, который отключает проверку типов на этапе компиляции. Переменная типа dynamic может содержать значение любого типа и менять его во время выполнения. Используйте с осторожностью!

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать dynamic переменную | `dynamic data;` |
| 2 | Присвоить строковое значение | `data = 'Привет';` |
| 3 | Проверить тип | `data.runtimeType` |
| 4 | Присвоить числовое значение (int) | `data = 42;` |
| 5 | Присвоить дробное значение (double) | `data = 3.14;` |
| 6 | Присвоить логическое значение (bool) | `data = true;` |
| 7 | Работать с dynamic переменными | Проверять тип перед операциями |
| 8 | Объяснить проблемы dynamic | Понять риски |

## Синтаксис и примеры

### Объявление и использование dynamic

```dart
// Объявление dynamic переменной
dynamic value;

// Присваивание разных типов
value = 'Строка';
print('Значение: $value, Тип: ${value.runtimeType}');
// Значение: Строка, Тип: String

value = 42;
print('Значение: $value, Тип: ${value.runtimeType}');
// Значение: 42, Тип: int

value = 3.14;
print('Значение: $value, Тип: ${value.runtimeType}');
// Значение: 3.14, Тип: double

value = true;
print('Значение: $value, Тип: ${value.runtimeType}');
// Значение: true, Тип: bool
```

### Проверка типа с runtimeType

```dart
dynamic data = 'Привет';
print(data.runtimeType);  // String

data = 100;
print(data.runtimeType);  // int
```

### Безопасная работа с dynamic

```dart
dynamic value = 'Привет';

// Проверка типа перед использованием
if (value is String) {
  print('Длина строки: ${value.length}');
} else if (value is int) {
  print('Число умноженное на 2: ${value * 2}');
}
```

## Частые ошибки

1. **Вызов методов без проверки типа**
   ```dart
   dynamic value = 100;
   print(value.length);  // ОШИБКА во время выполнения!
   // У int нет свойства length

   // Правильно - проверить тип
   if (value is String) {
     print(value.length);
   }
   ```

2. **Использование dynamic без необходимости**
   ```dart
   // Плохо - без необходимости
   dynamic age = 25;

   // Хорошо - конкретный тип
   int age = 25;
   ```

3. **Потеря безопасности типов**
   ```dart
   dynamic result = calculateSomething();
   int number = result;  // Может быть ошибка если result не int!

   // Безопаснее
   if (result is int) {
     int number = result;
   }
   ```

4. **Забыть, что ошибки будут в runtime**
   ```dart
   dynamic value = 'текст';
   int x = value * 2;  // Компилируется! Но упадет при выполнении!
   ```

## Дополнительные примеры

### Пример 1: Изменение типа

```dart
dynamic chameleon;

chameleon = 'Я строка';
print('$chameleon (${chameleon.runtimeType})');

chameleon = 42;
print('$chameleon (${chameleon.runtimeType})');

chameleon = 3.14;
print('$chameleon (${chameleon.runtimeType})');

chameleon = false;
print('$chameleon (${chameleon.runtimeType})');
```

### Пример 2: Безопасная работа

```dart
dynamic data = 'Привет';

// Безопасная работа с проверкой типа
if (data is String) {
  print('Это строка длиной ${data.length}');
} else if (data is int) {
  print('Это число: ${data * 2}');
} else if (data is double) {
  print('Это double: ${data.toStringAsFixed(2)}');
} else if (data is bool) {
  print('Это bool: ${data ? "да" : "нет"}');
}
```

### Пример 3: Опасность dynamic

```dart
// Компилируется без ошибок!
dynamic value = 100;
print(value.toUpperCase());  // Но упадет при выполнении!
// У int нет метода toUpperCase()

// Правильно
if (value is String) {
  print(value.toUpperCase());
} else {
  print('Это не строка!');
}
```

### Пример 4: Сравнение с конкретными типами

```dart
// С конкретным типом - ошибки на этапе компиляции
String text = 'Привет';
// int x = text;  // ОШИБКА КОМПИЛЯЦИИ - отлично!

// С dynamic - ошибки только во время выполнения
dynamic text2 = 'Привет';
// int x2 = text2;  // Компилируется, но упадет при выполнении!
```

## Когда использовать dynamic

### НЕ используйте dynamic если:
- Вы знаете тип данных
- Хотите безопасность типов
- Работаете с обычными данными
- Пишете обучающий код

### Можно использовать dynamic если:
- Работаете с JSON (до десериализации)
- Работаете с внешним API
- Реализуете сложную generic логику
- Точно знаете, что делаете

## Проблемы с dynamic

1. **Потеря проверки типов на этапе компиляции**
   ```dart
   dynamic value = 'текст';
   // Компилятор не поймает ошибку!
   int number = value;  // Упадет при выполнении
   ```

2. **Отсутствие автодополнения в IDE**
   ```dart
   dynamic text = 'Привет';
   text.  // IDE не покажет доступные методы
   ```

3. **Сложность отладки**
   ```dart
   dynamic a = getSomeValue();
   dynamic b = getAnotherValue();
   dynamic result = a + b;  // Что тут произойдет? Неясно!
   ```

4. **Ошибки во время выполнения**
   ```dart
   List<dynamic> list = [1, 'два', 3.0, true];
   for (var item in list) {
     print(item * 2);  // Упадет на 'два' и true!
   }
   ```

## Альтернативы dynamic

| Вместо | Используйте |
|--------|-------------|
| `dynamic value` | `int value` (конкретный тип) |
| `dynamic value` | `num value` (если int или double) |
| `dynamic value` | `Object value` (для любого объекта) |
| `dynamic value` | `var value` (вывод типа компилятором) |

## Подсказка по проверке типа

```dart
dynamic value = 'текст';

// Способ 1: is для проверки
if (value is String) {
  print('Это строка: $value');
}

// Способ 2: runtimeType для вывода
print('Тип: ${value.runtimeType}');

// Способ 3: комбинация
print('Значение: $value');
print('Тип: ${value.runtimeType}');
print('Это String? ${value is String}');
print('Это int? ${value is int}');
```

## Вопрос для размышления

**Почему лучше избегать dynamic?**

Подумайте о:
- Когда обнаруживаются ошибки (компиляция vs выполнение)
- Помощь IDE (автодополнение, подсказки)
- Читаемость кода (понятно ли какой тип?)
- Безопасность (можно ли случайно сделать ошибку?)

## Сравнение типов

```dart
// static typing - безопасно
String text = 'Привет';
// text = 42;  // ОШИБКА КОМПИЛЯЦИИ ✓

// var - тип выводится, но фиксируется
var text2 = 'Привет';
// text2 = 42;  // ОШИБКА КОМПИЛЯЦИИ ✓

// dynamic - без проверок
dynamic text3 = 'Привет';
text3 = 42;  // OK, но опасно ✗
```
