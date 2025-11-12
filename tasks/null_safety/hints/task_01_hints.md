# Подсказки к Задаче 1: Знакомство с null

## Подсказка 1: Что такое null
null - это специальное значение в Dart, которое означает "отсутствие значения". Это не пустая строка, не ноль, а именно отсутствие любого значения.

## Подсказка 2: Nullable типы
Чтобы переменная могла содержать null, нужно добавить знак вопроса (?) после типа:
```dart
String? nickname;  // Может быть null
String name;       // НЕ может быть null
```

## Подсказка 3: Присвоение null
Nullable переменной можно присвоить null:
```dart
String? city;
city = null;  // Это работает

String country;
// country = null;  // ОШИБКА! String не может быть null
```

## Подсказка 4: Проверка на null
Используйте оператор сравнения == null:
```dart
String? value = null;
if (value == null) {
  print('Значение отсутствует');
}
```

## Подсказка 5: Изменение значения
Nullable переменная может менять значение с null на реальное и обратно:
```dart
String? message = null;
print(message == null);  // true

message = 'Привет';
print(message == null);  // false
```

## Подсказка 6: Пример
```dart
// Non-nullable переменная
String greeting = 'Привет';

// Nullable переменная
String? optionalText;
optionalText = null;
print('Пусто: ${optionalText == null}');  // true

optionalText = 'Есть текст';
print('Пусто: ${optionalText == null}');  // false
```
