// Задача 8: Цепочка nullable вызовов (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем структуру с вложенными nullable Map
  // Map<String, dynamic> может содержать значения любого типа
  Map<String, dynamic> user = {
    'name': 'Иван',
    'address': {
      'city': 'Москва',
      'street': 'Ленина',
      'building': null // Номер дома не указан
    },
    'contacts': null // Контакты отсутствуют
  };

  // Выводим данные пользователя
  print('Данные пользователя:');
  print('Имя: ${user['name']}');

  // 2. Безопасно извлекаем вложенные значения используя цепочки ?.
  // user['address'] возвращает Map
  // ?['city'] безопасно получает значение из вложенного Map
  // Если address был бы null, вся цепочка вернула бы null
  String? city = user['address']?['city'];
  print('Город: $city');

  // Получаем номер дома - он null в данных
  dynamic building = user['address']?['building'];
  print('Номер дома: $building (не указан)');

  // Получаем телефон из contacts
  // contacts равен null, поэтому вся цепочка вернет null
  dynamic phone = user['contacts']?['phone'];
  print('Телефон: $phone (контакты не заданы)');

  // Получаем название компании из работы
  // user['work'] вернет null (ключа нет в Map)
  // Поэтому вся цепочка вернет null
  dynamic companyName = user['work']?['company']?['name'];
  print('Компания: $companyName (работа не указана)');

  print('');

  // 3. Демонстрируем безопасное извлечение
  print('Безопасное извлечение:');

  // Каждая цепочка безопасно обрабатывает null
  // Оператор ?. проверяет на null перед доступом к свойству
  print("user['address']?['city']: ${user['address']?['city']}");
  print("user['address']?['building']: ${user['address']?['building']}");
  print("user['contacts']?['phone']: ${user['contacts']?['phone']}");
  print("user['work']?['company']?['name']: ${user['work']?['company']?['name']}");

  print('');

  // 4. Тестируем функцию getUserInfo с данными пользователя
  print('Тест getUserInfo:');
  String info = getUserInfo(user);
  print('Полная информация: $info');

  print('');

  // Тестируем функцию с null пользователем
  print('Тест с null пользователем:');
  String infoNull = getUserInfo(null);
  print('Информация: $infoNull');
}

// Функция getUserInfo безопасно извлекает информацию из Map пользователя
// Параметр user - nullable, может быть null
String getUserInfo(Map<String, dynamic>? user) {
  // Безопасно извлекаем имя пользователя
  // Используем цепочку ?. и ?? для значения по умолчанию
  // Если user null, вернется 'Гость'
  // Если user['name'] null, вернется 'Гость'
  String name = user?['name'] ?? 'Гость';

  // Безопасно извлекаем город из вложенного Map address
  // user?['address'] - безопасный доступ к ключу 'address'
  // ?['city'] - безопасный доступ к ключу 'city' во вложенном Map
  // ?? 'неизвестно' - значение по умолчанию если результат null
  String city = user?['address']?['city'] ?? 'неизвестно';

  // Безопасно извлекаем телефон из вложенного Map contacts
  // Если contacts null, вернется 'не указан'
  String phone = user?['contacts']?['phone'] ?? 'не указан';

  // Формируем и возвращаем информационную строку
  return '$name из города $city, телефон: $phone';
}
