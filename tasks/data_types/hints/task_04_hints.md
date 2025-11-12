# Подсказки к Задаче 4: Логический тип bool

## Краткое описание
bool (boolean) - это тип данных, который может иметь только два значения: true (истина) или false (ложь). Используется для логических операций и проверки условий.

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать переменную для солнечной погоды | `bool isSunny = true;` |
| 2 | Создать переменную для теплой погоды | `bool isWarm = true;` |
| 3 | Создать переменную для выходного дня | `bool isWeekend = false;` |
| 4 | Проверить ВСЕ условия для пляжа | `bool result = a && b && c;` |
| 5 | Инвертировать условие для зонта | `bool result = !isSunny;` |
| 6 | Вывести результаты с объяснениями | Использовать `print()` |

## Синтаксис и примеры

### Основы bool

```dart
// Объявление bool переменных
bool isStudent = true;
bool hasLicense = false;

// Использование в print
print(isStudent);  // true
print(hasLicense);  // false
```

### Логические операторы

```dart
bool a = true;
bool b = false;

// Оператор && (И) - оба должны быть true
print(a && b);  // false
print(a && a);  // true
print(b && b);  // false

// Оператор || (ИЛИ) - хотя бы один true
print(a || b);  // true
print(b || b);  // false

// Оператор ! (НЕ) - переворачивает значение
print(!a);  // false
print(!b);  // true
```

### Комбинирование условий

```dart
bool isSunny = true;
bool isWarm = true;
bool isWeekend = false;

// Все условия должны быть true
bool canGoToBeach = isSunny && isWarm && isWeekend;
print(canGoToBeach);  // false (потому что isWeekend = false)

// Хотя бы одно условие true
bool goodWeather = isSunny || isWarm;
print(goodWeather);  // true
```

## Частые ошибки

1. **Использование строк вместо bool**
   ```dart
   bool isReady = 'true';  // ОШИБКА! Это строка
   bool isReady = true;     // Правильно
   ```

2. **Путаница между && и ||**
   ```dart
   // && требует ВСЕ условия true
   print(true && false);   // false

   // || требует ХОТЯ БЫ ОДНО true
   print(true || false);   // true
   ```

3. **Двойное отрицание**
   ```dart
   bool value = true;
   print(!value);   // false
   print(!!value);  // true (вернулось к исходному)
   ```

4. **Забыть скобки при сложных выражениях**
   ```dart
   bool result = a && b || c;  // Может быть неочевидно
   bool result = (a && b) || c;  // Лучше - явно видна логика
   ```

## Дополнительные примеры

### Пример 1: Проверка доступа

```dart
bool hasPassword = true;
bool isAdmin = false;
bool isOwner = true;

// Доступ есть если: есть пароль И (админ ИЛИ владелец)
bool hasAccess = hasPassword && (isAdmin || isOwner);
print(hasAccess);  // true
```

### Пример 2: Проверка погоды

```dart
bool isRaining = false;
bool isCold = false;

bool needJacket = isRaining || isCold;
print('Нужна куртка: $needJacket');  // false

bool niceWeather = !isRaining && !isCold;
print('Хорошая погода: $niceWeather');  // true
```

### Пример 3: Таблица истинности

```dart
// Для понимания &&
print('true && true = ${true && true}');      // true
print('true && false = ${true && false}');    // false
print('false && true = ${false && true}');    // false
print('false && false = ${false && false}');  // false

// Для понимания ||
print('true || true = ${true || true}');      // true
print('true || false = ${true || false}');    // true
print('false || true = ${false || true}');    // true
print('false || false = ${false || false}');  // false
```

## Подсказка по логике

Как читать логические выражения:

- `a && b` - "a И b" - оба должны быть true
- `a || b` - "a ИЛИ b" - хотя бы один true
- `!a` - "НЕ a" - противоположное значение
- `a && b && c` - "a И b И c" - все три должны быть true

## Подсказка по выводу

```dart
print('Погода:');
print('☀️ Солнечно: $isSunny');
print('🌡️ Тепло: $isWarm');
print('📅 Выходной: $isWeekend');
print('');
print('Решения:');
print('🏖️ Можно на пляж: $canGoToBeach');
print('☂️ Взять зонт: $shouldTakeUmbrella');
```
