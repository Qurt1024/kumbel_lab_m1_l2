# Подсказки к Задаче 8: Цепочка nullable вызовов

## Подсказка 1: Цепочка ?. операторов
Можно создавать длинные цепочки безопасных вызовов:
```dart
user?.address?.city?.name
```

## Подсказка 2: Как работает цепочка
Если ЛЮБОЕ звено в цепочке null, вся цепочка вернет null:
```dart
obj?.field1?.field2?.field3
// Если field1 null - вернется null
// Если field2 null - вернется null
// И так далее
```

## Подсказка 3: Доступ к вложенным Map
Для Map используйте оператор ?[] вместо ?.:
```dart
Map<String, dynamic> data = {
  'user': {
    'name': 'Иван',
    'address': {
      'city': 'Москва'
    }
  }
};

var city = data['user']?['address']?['city'];
print(city);  // Москва
```

## Подсказка 4: Цепочка с null элементами
Если промежуточный элемент null, остановится на нем:
```dart
Map<String, dynamic> data = {
  'user': {
    'name': 'Иван',
    'contacts': null
  }
};

var phone = data['user']?['contacts']?['phone'];
print(phone);  // null (contacts = null)
```

## Подсказка 5: Комбинация с ??
Цепочку можно комбинировать с ?? для значений по умолчанию:
```dart
var city = data['user']?['address']?['city'] ?? 'Неизвестно';
var phone = data['user']?['contacts']?['phone'] ?? 'Не указан';
```

## Подсказка 6: Функция для извлечения данных
```dart
String getUserInfo(Map<String, dynamic>? user) {
  if (user == null) {
    return 'Нет данных о пользователе';
  }

  var name = user['name'] ?? 'Аноним';
  var city = user['address']?['city'] ?? 'неизвестно';
  var phone = user['contacts']?['phone'] ?? 'не указан';

  return '$name из города $city, телефон: $phone';
}
```

## Подсказка 7: Пример со сложной структурой
```dart
void main() {
  Map<String, dynamic> data = {
    'user': {
      'name': 'Иван',
      'address': {
        'city': 'Москва',
        'street': 'Ленина',
        'building': null
      },
      'contacts': null
    }
  };

  // Безопасное извлечение
  print('Имя: ${data['user']?['name']}');
  print('Город: ${data['user']?['address']?['city']}');
  print('Дом: ${data['user']?['address']?['building'] ?? "не указан"}');
  print('Телефон: ${data['user']?['contacts']?['phone'] ?? "не указан"}');

  // Несуществующий путь
  var company = data['user']?['work']?['company']?['name'];
  print('Компания: ${company ?? "нет данных"}');
}
```
