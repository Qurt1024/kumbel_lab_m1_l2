// Задача 8: Преобразование Map (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map<String, int> с температурами городов в Цельсиях
  Map<String, int> temperatures = {
    'Москва': 20,
    'Санкт-Петербург': 18,
    'Казань': 22,
    'Сочи': 28
  };

  // Выводим температуры в Цельсиях
  print('Температуры в Цельсиях:');
  print('Москва: ${temperatures['Москва']}°C');
  print('Санкт-Петербург: ${temperatures['Санкт-Петербург']}°C');
  print('Казань: ${temperatures['Казань']}°C');
  print('Сочи: ${temperatures['Сочи']}°C');
  print('');

  // 2. Преобразуем температуры в Фаренгейты
  // Формула: F = C * 9/5 + 32
  // Создаем новый Map вручную для каждого города
  Map<String, double> temperaturesFahrenheit = {};

  // Преобразуем каждую температуру по формуле
  temperaturesFahrenheit['Москва'] = temperatures['Москва']! * 9 / 5 + 32;
  temperaturesFahrenheit['Санкт-Петербург'] = temperatures['Санкт-Петербург']! * 9 / 5 + 32;
  temperaturesFahrenheit['Казань'] = temperatures['Казань']! * 9 / 5 + 32;
  temperaturesFahrenheit['Сочи'] = temperatures['Сочи']! * 9 / 5 + 32;

  print('Температуры в Фаренгейтах:');
  print('Москва: ${temperaturesFahrenheit['Москва']}°F');
  print('Санкт-Петербург: ${temperaturesFahrenheit['Санкт-Петербург']}°F');
  print('Казань: ${temperaturesFahrenheit['Казань']}°F');
  print('Сочи: ${temperaturesFahrenheit['Сочи']}°F');
  print('');

  // 3. Создаем Map<String, String> с температурами в формате строки
  Map<String, String> temperaturesString = {};

  // Преобразуем каждую температуру в строку с описанием
  temperaturesString['Москва'] = '${temperatures['Москва']} градусов Цельсия';
  temperaturesString['Санкт-Петербург'] = '${temperatures['Санкт-Петербург']} градусов Цельсия';
  temperaturesString['Казань'] = '${temperatures['Казань']} градусов Цельсия';
  temperaturesString['Сочи'] = '${temperatures['Сочи']} градусов Цельсия';

  print('Температуры как строки:');
  print('Москва: "${temperaturesString['Москва']}"');
  print('Санкт-Петербург: "${temperaturesString['Санкт-Петербург']}"');
  print('Казань: "${temperaturesString['Казань']}"');
  print('Сочи: "${temperaturesString['Сочи']}"');
  print('');

  // 4. Создаем Map где ключи - это температуры, а значения - города
  // Меняем местами ключи и значения
  Map<int, String> citiesByTemperature = {};

  // Переворачиваем каждую пару ключ-значение
  citiesByTemperature[temperatures['Москва']!] = 'Москва';
  citiesByTemperature[temperatures['Санкт-Петербург']!] = 'Санкт-Петербург';
  citiesByTemperature[temperatures['Казань']!] = 'Казань';
  citiesByTemperature[temperatures['Сочи']!] = 'Сочи';

  print('Города по температуре:');
  print('20: ${citiesByTemperature[20]}');
  print('18: ${citiesByTemperature[18]}');
  print('22: ${citiesByTemperature[22]}');
  print('28: ${citiesByTemperature[28]}');
}
