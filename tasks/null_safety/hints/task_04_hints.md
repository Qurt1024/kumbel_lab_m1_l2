# Подсказки к Задаче 4: Оператор утверждения не-null (!)

## Подсказка 1: Оператор ! (null assertion)
Оператор ! говорит компилятору "я уверен, что это значение НЕ null":
```dart
text!.length  // Утверждаем что text не null
```

## Подсказка 2: Когда использовать !
Используйте ! только когда вы УВЕРЕНЫ, что значение не null:
```dart
String? name = 'Иван';
// Мы точно знаем что name не null
int length = name!.length;  // Безопасно
```

## Подсказка 3: ОПАСНОСТЬ оператора !
Если использовать ! на null значении, программа упадет с ошибкой:
```dart
String? text = null;
// print(text!.length);  // ОШИБКА во время выполнения!
```

## Подсказка 4: Разница между ?. и !
- `?.` безопасен - вернет null если объект null
- `!` опасен - упадет с ошибкой если объект null

```dart
String? data = null;
print(data?.length);  // null (безопасно)
// print(data!.length);  // ОШИБКА! (упадет)
```

## Подсказка 5: Правильный способ
Лучше проверить на null перед использованием:
```dart
String? message = null;

// Плохо - может упасть
// print(message!.length);

// Хорошо - безопасная проверка
if (message != null) {
  print(message.length);  // Здесь ! не нужен
}
```

## Подсказка 6: Пример безопасного использования
```dart
String? text = 'Dart';
int? number = 42;

// Используем ! когда УВЕРЕНЫ
print('Текст: ${text!.toUpperCase()}');  // DART
print('Число × 2: ${number! * 2}');      // 84

// Не используем ! когда не уверены
String? empty = null;
// print(empty!.length);  // НЕ ДЕЛАЙТЕ ТАК!

// Правильно:
if (empty != null) {
  print(empty.length);
} else {
  print('Значение null');
}
```
