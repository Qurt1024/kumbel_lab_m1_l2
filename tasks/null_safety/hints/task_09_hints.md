# Подсказки к Задаче 9: Комплексная работа с nullable переменными

## Подсказка 1: Работа с несколькими nullable полями
Когда у вас много nullable переменных, проверяйте каждую:
```dart
String? firstName = 'Иван';
String? lastName = 'Иванов';

if (firstName != null && lastName != null) {
  print('Полное имя: $firstName $lastName');
}
```

## Подсказка 2: Приоритет значений
Используйте ?? для выбора первого не-null значения:
```dart
String? email = 'user@example.com';
String? phone = null;

var contact = email ?? phone ?? 'Нет контактов';
print(contact);  // user@example.com
```

## Подсказка 3: Вычисления с nullable числами
При расчетах проверяйте наличие значений:
```dart
double? price = 1000.0;
double? discount = null;

double finalPrice = price ?? 0;
if (discount != null) {
  finalPrice = finalPrice * (1 - discount);
}
print('Итого: $finalPrice');
```

## Подсказка 4: Формирование строки из nullable полей
Проверяйте каждое поле перед использованием:
```dart
String? city = null;
String? street = 'Ленина';
String? building = '10';

if (city != null) {
  print('Адрес: г. $city, ул. $street, д. $building');
} else {
  print('Город не указан');
}
```

## Подсказка 5: Подсчет заполненных полей
Можно считать сколько полей не null:
```dart
int countNonNull(List<dynamic> values) {
  return values.where((v) => v != null).length;
}

var filled = countNonNull([name, email, phone, city]);
print('Заполнено: $filled');
```

## Подсказка 6: Пример обработки данных пользователя
```dart
void displayUserData() {
  String? firstName = 'Иван';
  String? lastName = 'Петров';
  String? email = 'ivan@mail.com';
  String? phone = null;

  // Полное имя
  if (firstName != null && lastName != null) {
    print('Имя: $firstName $lastName');
  } else {
    print('Имя не полностью заполнено');
  }

  // Контакт (приоритет email)
  var contact = email ?? phone ?? 'Нет контактов';
  print('Контакт: $contact');

  // Статистика
  var fields = [firstName, lastName, email, phone];
  var filled = fields.where((f) => f != null).length;
  var empty = fields.length - filled;
  print('Заполнено: $filled, Пусто: $empty');
}
```

## Подсказка 7: Обработка цены со скидкой
```dart
void calculatePrice() {
  String? product = 'Ноутбук';
  double? price = 50000.0;
  double? discount = null;

  print('Товар: ${product ?? "не указан"}');
  print('Цена: ${price ?? 0} руб.');

  if (discount != null) {
    var finalPrice = (price ?? 0) * (1 - discount);
    print('Со скидкой: $finalPrice руб.');
  } else {
    print('Скидка не применена');
  }
}
```
