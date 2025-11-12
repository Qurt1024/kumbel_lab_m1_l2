# Подсказки к Задаче 5: Проверка на null с if

## Подсказка 1: Самый безопасный способ
Проверка через if - это самый надежный способ работы с nullable значениями:
```dart
if (value != null) {
  // Здесь value точно не null
  print(value.length);
}
```

## Подсказка 2: Type promotion
После проверки if (value != null) компилятор автоматически "понимает", что внутри блока значение не null:
```dart
String? text = 'Привет';
if (text != null) {
  // Здесь text имеет тип String (не String?)
  print(text.length);  // Можно использовать без ! или ?.
}
```

## Подсказка 3: Проверка в функции
Функция может принимать nullable параметры и проверять их:
```dart
void processText(String? input) {
  if (input == null) {
    print('Нет данных');
    return;
  }
  // Здесь input точно не null
  print('Длина: ${input.length}');
}
```

## Подсказка 4: Функция с nullable возвратом
Функция может возвращать null:
```dart
int? calculateSquare(int? number) {
  if (number == null) {
    return null;
  }
  return number * number;
}
```

## Подсказка 5: Обработка разных случаев
Можно обработать оба случая - null и не-null:
```dart
String? name = getUserName();

if (name != null) {
  print('Привет, $name!');
} else {
  print('Привет, гость!');
}
```

## Подсказка 6: Пример с функциями
```dart
void showMessage(String? message) {
  if (message == null) {
    print('Сообщение пустое');
    return;
  }

  print('Сообщение: $message');
  print('Длина: ${message.length}');
  print('Верхний регистр: ${message.toUpperCase()}');
}

int? multiply(int? a, int? b) {
  if (a == null || b == null) {
    return null;
  }
  return a * b;
}

void main() {
  showMessage('Привет');  // Выведет информацию
  showMessage(null);      // Выведет "Сообщение пустое"

  print(multiply(5, 3));   // 15
  print(multiply(null, 3)); // null
}
```
