// Задача 10: Система заказа с nullable полями (Сложная) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map для первого заказа
  Map<String, dynamic> order1 = {
    'orderId': 'ORD-001',
    'customerName': 'Иван Иванов',
    'email': 'ivan@example.com',
    'phone': null, // Телефон не указан
    'productName': 'Ноутбук',
    'price': 50000.0,
    'deliveryAddress': 'ул. Ленина, 10',
    'promoCode': 'SALE20',
    'discount': 0.2 // 20% скидка
  };

  // 2. Выводим информацию о первом заказе
  print('========== ЗАКАЗ #1: ${order1['orderId']} ==========');
  print('Покупатель: ${order1['customerName']}');
  print('Товар: ${order1['productName']}');
  print('Цена: ${order1['price']} руб.');
  print('');

  // 3. Проверяем наличие контактов
  print('Контакты:');

  String? email1 = order1['email'];
  String? phone1 = order1['phone'];

  // Выводим email с проверкой на null
  print('Email: ${email1 ?? "не указан"}');

  // Выводим телефон с проверкой на null
  print('Телефон: ${phone1 ?? "не указан"}');

  // Проверяем наличие хотя бы одного контакта
  // Используем оператор || (логическое ИЛИ)
  if (email1 != null || phone1 != null) {
    print('✓ Контакты указаны');
  } else {
    print('✗ ВНИМАНИЕ: Контакты не указаны!');
  }

  print('');

  // Информация о промокоде и скидке
  String? promoCode1 = order1['promoCode'];
  double? discount1 = order1['discount'];

  if (promoCode1 != null && discount1 != null) {
    // Вычисляем процент скидки
    int discountPercent = (discount1 * 100).toInt();
    print('Промокод: $promoCode1 (скидка $discountPercent%)');
  } else {
    print('Промокод: не указан');
  }

  // 4. Вычисляем итоговую сумму с учетом скидки
  double price1 = order1['price'];
  double discountAmount1 = 0.0;
  double subtotal1 = price1;

  if (discount1 != null) {
    // Вычисляем сумму скидки
    discountAmount1 = price1 * discount1;
    subtotal1 = price1 - discountAmount1;
    print('Скидка: -$discountAmount1 руб.');
  } else {
    print('Скидка: 0.0 руб.');
  }

  print('Итого: $subtotal1 руб.');
  print('');

  // 5. Определяем способ доставки
  String? deliveryAddress1 = order1['deliveryAddress'];
  double deliveryCost1 = 0.0;

  if (deliveryAddress1 != null) {
    // Если адрес указан - доставка 200 руб.
    deliveryCost1 = 200.0;
    print('Доставка: $deliveryAddress1 (+$deliveryCost1 руб.)');
  } else {
    // Если адрес не указан - самовывоз
    print('Доставка: Самовывоз (бесплатно)');
  }

  // Вычисляем итоговую сумму к оплате
  double total1 = subtotal1 + deliveryCost1;
  print('ИТОГО К ОПЛАТЕ: $total1 руб.');

  print('');

  // 6. Создаем второй заказ с другими значениями
  Map<String, dynamic> order2 = {
    'orderId': 'ORD-002',
    'customerName': 'Мария Петрова',
    'email': null, // Email не указан
    'phone': null, // Телефон не указан
    'productName': 'Телефон',
    'price': 20000.0,
    'deliveryAddress': null, // Адрес не указан - самовывоз
    'promoCode': null, // Промокод не указан
    'discount': null // Скидки нет
  };

  // 7. Выводим информацию о втором заказе
  print('========== ЗАКАЗ #2: ${order2['orderId']} ==========');
  print('Покупатель: ${order2['customerName']}');
  print('Товар: ${order2['productName']}');
  print('Цена: ${order2['price']} руб.');
  print('');

  // Проверяем наличие контактов
  print('Контакты:');

  String? email2 = order2['email'];
  String? phone2 = order2['phone'];

  print('Email: ${email2 ?? "не указан"}');
  print('Телефон: ${phone2 ?? "не указан"}');

  // Проверяем наличие хотя бы одного контакта
  if (email2 != null || phone2 != null) {
    print('✓ Контакты указаны');
  } else {
    print('✗ ВНИМАНИЕ: Контакты не указаны!');
  }

  print('');

  // Информация о промокоде
  String? promoCode2 = order2['promoCode'];
  double? discount2 = order2['discount'];

  if (promoCode2 != null && discount2 != null) {
    int discountPercent = (discount2 * 100).toInt();
    print('Промокод: $promoCode2 (скидка $discountPercent%)');
  } else {
    print('Промокод: не указан');
  }

  // Вычисляем итоговую сумму
  double price2 = order2['price'];
  double discountAmount2 = 0.0;
  double subtotal2 = price2;

  if (discount2 != null) {
    discountAmount2 = price2 * discount2;
    subtotal2 = price2 - discountAmount2;
    print('Скидка: -$discountAmount2 руб.');
  } else {
    print('Скидка: 0.0 руб.');
  }

  print('Итого: $subtotal2 руб.');
  print('');

  // Определяем способ доставки
  String? deliveryAddress2 = order2['deliveryAddress'];
  double deliveryCost2 = 0.0;

  if (deliveryAddress2 != null) {
    deliveryCost2 = 200.0;
    print('Доставка: $deliveryAddress2 (+$deliveryCost2 руб.)');
  } else {
    print('Доставка: Самовывоз (бесплатно)');
  }

  // Вычисляем итоговую сумму к оплате
  double total2 = subtotal2 + deliveryCost2;
  print('ИТОГО К ОПЛАТЕ: $total2 руб.');

  print('');

  // 8. Выводим статистику для обоих заказов
  print('========== СТАТИСТИКА ==========');

  // Подсчитываем заполненные поля для заказа 1
  int filled1 = 0;
  int null1 = 0;

  // Проверяем каждое поле заказа 1
  if (order1['orderId'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['customerName'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['email'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['phone'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['productName'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['price'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['deliveryAddress'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['promoCode'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;
  if (order1['discount'] != null) filled1 = filled1 + 1; else null1 = null1 + 1;

  // Подсчитываем заполненные поля для заказа 2
  int filled2 = 0;
  int null2 = 0;

  // Проверяем каждое поле заказа 2
  if (order2['orderId'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['customerName'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['email'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['phone'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['productName'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['price'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['deliveryAddress'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['promoCode'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;
  if (order2['discount'] != null) filled2 = filled2 + 1; else null2 = null2 + 1;

  print('Заказ #1: $filled1 полей заполнено, $null1 null');
  print('Заказ #2: $filled2 поля заполнено, $null2 null');
}
