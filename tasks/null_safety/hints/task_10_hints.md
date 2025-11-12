# Подсказки к Задаче 10: Система заказа с nullable полями

## Подсказка 1: Структура данных заказа
Используйте Map<String, dynamic> для хранения разных типов данных:
```dart
Map<String, dynamic> order = {
  'orderId': 'ORD-001',
  'customerName': 'Иван Иванов',
  'email': 'ivan@mail.com',  // может быть null
  'phone': null,
  'price': 50000.0,
  'discount': 0.2  // 20% или null
};
```

## Подсказка 2: Безопасное извлечение значений
Всегда проверяйте тип и наличие значения:
```dart
var email = order['email'] as String?;
var price = order['price'] as double;
var discount = order['discount'] as double?;
```

## Подсказка 3: Проверка контактов
Проверьте наличие хотя бы одного способа связи:
```dart
bool hasContact = order['email'] != null || order['phone'] != null;
if (hasContact) {
  print('Контакты указаны');
} else {
  print('ВНИМАНИЕ: Нет контактов!');
}
```

## Подсказка 4: Расчет итоговой суммы
Вычислите цену с учетом скидки и доставки:
```dart
double price = order['price'] as double;
double? discount = order['discount'] as double?;

double finalPrice = price;
if (discount != null) {
  finalPrice = price * (1 - discount);
}

// Добавить доставку
bool hasDelivery = order['deliveryAddress'] != null;
if (hasDelivery) {
  finalPrice += 200;  // стоимость доставки
}
```

## Подсказка 5: Форматированный вывод
Создайте читаемый вывод информации:
```dart
void printOrderInfo(Map<String, dynamic> order) {
  print('========== ЗАКАЗ #${order['orderId']} ==========');
  print('Покупатель: ${order['customerName']}');
  print('Товар: ${order['productName']}');
  print('Цена: ${order['price']} руб.');

  // Контакты
  print('\nКонтакты:');
  print('Email: ${order['email'] ?? "не указан"}');
  print('Телефон: ${order['phone'] ?? "не указан"}');

  // Промокод и скидка
  var promoCode = order['promoCode'];
  if (promoCode != null) {
    var discount = (order['discount'] as double) * 100;
    print('\nПромокод: $promoCode (скидка ${discount.toInt()}%)');
  }
}
```

## Подсказка 6: Подсчет заполненных полей
Посчитайте сколько полей заполнено:
```dart
int countFilledFields(Map<String, dynamic> order) {
  int count = 0;
  for (var value in order.values) {
    if (value != null) {
      count++;
    }
  }
  return count;
}

int filled = countFilledFields(order);
int total = order.length;
int empty = total - filled;
print('$filled полей заполнено, $empty null');
```

## Подсказка 7: Сравнение двух заказов
```dart
void compareOrders(Map<String, dynamic> order1, Map<String, dynamic> order2) {
  int filled1 = countFilledFields(order1);
  int filled2 = countFilledFields(order2);

  print('========== СТАТИСТИКА ==========');
  print('Заказ #${order1['orderId']}: $filled1 полей заполнено');
  print('Заказ #${order2['orderId']}: $filled2 полей заполнено');
}
```

## Подсказка 8: Пример полной обработки заказа
```dart
void processOrder(Map<String, dynamic> order) {
  // Базовая информация
  print('========== ЗАКАЗ ==========');
  print('ID: ${order['orderId']}');

  // Расчет
  double price = order['price'] as double;
  double? discount = order['discount'] as double?;

  double total = price;
  if (discount != null) {
    double discountAmount = price * discount;
    print('Скидка: -$discountAmount руб.');
    total = price - discountAmount;
  }

  // Доставка
  var address = order['deliveryAddress'] as String?;
  if (address != null) {
    print('Доставка: $address (+200 руб.)');
    total += 200;
  } else {
    print('Доставка: Самовывоз');
  }

  print('ИТОГО: $total руб.');
}
```
