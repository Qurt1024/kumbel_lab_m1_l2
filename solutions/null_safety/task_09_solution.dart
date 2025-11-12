// Задача 9: Комплексная работа с nullable переменными (Сложная) - РЕШЕНИЕ

void main() {
  // 1. Создаем nullable переменные для пользователя
  String? firstName = 'Иван';
  String? lastName = 'Иванов';
  String? email = 'ivan@example.com';
  String? phone = null; // Телефон не указан

  // 2. Выводим информацию о пользователе
  print('=== Информация о пользователе ===');

  // Проверяем, что оба поля имени заполнены
  // Используем оператор && (логическое И) для проверки обоих условий
  if (firstName != null && lastName != null) {
    // После проверки компилятор знает, что firstName и lastName не null
    print('Полное имя: $firstName $lastName');
  } else {
    print('Полное имя: не указано');
  }

  // 3. Выводим контакт (email если есть, иначе phone, иначе "Нет контактов")
  // Используем каскад операторов ??
  // Сначала проверяется email, если null - проверяется phone, если null - используется строка по умолчанию
  String contact = email ?? phone ?? 'Нет контактов';
  print('Контакт: $contact');

  print('');

  // 4. Создаем nullable переменные для товара
  String? productName = 'Ноутбук';
  double? price = 50000.0;
  double? discount = null; // Скидка не указана

  print('=== Информация о товаре ===');

  print('Товар: ${productName ?? "не указан"}');
  print('Цена: ${price ?? 0.0} руб.');

  // Проверяем наличие скидки
  if (discount != null) {
    print('Скидка: ${discount * 100}%');
  } else {
    print('Скидка: не указана');
  }

  // 5. Вычисляем финальную цену с учетом скидки (если есть)
  double finalPrice;
  if (price != null && discount != null) {
    // Если цена и скидка указаны, применяем скидку
    // Скидка указана как десятичная дробь (0.2 = 20%)
    finalPrice = price - (price * discount);
  } else if (price != null) {
    // Если только цена указана, используем ее
    finalPrice = price;
  } else {
    // Если цена не указана, устанавливаем 0
    finalPrice = 0.0;
  }

  print('Итого: $finalPrice руб.');

  print('');

  // 6. Создаем nullable переменные для адреса доставки
  String? city = null; // Город не указан
  String? street = 'Ленина';
  String? building = '10';

  print('=== Адрес доставки ===');

  // 7. Выводим полный адрес или "Самовывоз" если город не указан
  if (city != null) {
    // Если город указан, формируем полный адрес
    String fullAddress = 'г. $city, ул. ${street ?? "не указана"}, д. ${building ?? "не указан"}';
    print(fullAddress);
  } else {
    // Если город не указан - самовывоз
    print('Самовывоз (город не указан)');
  }

  print('');

  // 8. Проверяем все переменные и выводим статистику
  print('=== Статистика ===');

  // Подсчитываем количество полей
  int totalFields = 10; // Всего 10 переменных
  int filledFields = 0; // Счетчик заполненных полей

  // Проверяем каждую переменную на null
  if (firstName != null) filledFields = filledFields + 1;
  if (lastName != null) filledFields = filledFields + 1;
  if (email != null) filledFields = filledFields + 1;
  if (phone != null) filledFields = filledFields + 1;
  if (productName != null) filledFields = filledFields + 1;
  if (price != null) filledFields = filledFields + 1;
  if (discount != null) filledFields = filledFields + 1;
  if (city != null) filledFields = filledFields + 1;
  if (street != null) filledFields = filledFields + 1;
  if (building != null) filledFields = filledFields + 1;

  // Вычисляем количество незаполненных полей
  int nullFields = totalFields - filledFields;

  print('Всего полей: $totalFields');
  print('Заполнено: $filledFields');
  print('Не заполнено (null): $nullFields');
}
