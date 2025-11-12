# Подсказки к Задаче 3: Оператор безопасного вызова (?.)

## Подсказка 1: Оператор ?. (null-aware operator)
Оператор ?. позволяет безопасно вызывать методы и свойства на nullable объектах:
```dart
text?.length  // Безопасно получить длину
```

## Подсказка 2: Как работает ?.
- Если объект НЕ null, вызывается метод/свойство
- Если объект null, возвращается null (без ошибки)

```dart
String? message = 'Привет';
print(message?.length);  // 6

message = null;
print(message?.length);  // null
```

## Подсказка 3: Вызов методов
Можно вызывать любые методы через ?.:
```dart
String? text = 'hello';
print(text?.toUpperCase());  // HELLO

text = null;
print(text?.toUpperCase());  // null
```

## Подсказка 4: Комбинация с ??
Часто ?. используют вместе с ?? для значения по умолчанию:
```dart
String? name = null;
int length = name?.length ?? 0;  // 0
String upper = name?.toUpperCase() ?? 'ПУСТО';  // ПУСТО
```

## Подсказка 5: Без ?. будет ошибка
Попытка вызвать метод на null без ?. приведет к ошибке:
```dart
String? text = null;
// print(text.length);  // ОШИБКА! Null check operator used on a null value
print(text?.length);     // null (безопасно)
```

## Подсказка 6: Пример с цепочкой
```dart
String? data = 'Dart Programming';
print('Длина: ${data?.length}');           // Длина: 16
print('Верхний регистр: ${data?.toUpperCase()}');  // DART PROGRAMMING

data = null;
print('Длина: ${data?.length ?? 0}');      // Длина: 0
print('Текст: ${data?.toUpperCase() ?? "НЕТ ДАННЫХ"}');  // НЕТ ДАННЫХ
```
