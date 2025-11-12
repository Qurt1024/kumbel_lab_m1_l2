// Задача 2: Использование var для разных типов (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем переменную city - var автоматически определит тип String
  var city = 'Москва';

  // 2. Создаем переменную temperature - var автоматически определит тип int
  var temperature = 15;

  // 3. Создаем переменную isRaining - var автоматически определит тип bool
  var isRaining = false;

  // 4. Выводим все три переменные
  print('Город: $city');
  print('Температура: $temperature градусов');
  print('Дождь: $isRaining');

  // Дополнительно: можем проверить типы переменных
  print('\nТипы переменных:');
  print('city имеет тип: ${city.runtimeType}'); // String
  print('temperature имеет тип: ${temperature.runtimeType}'); // int
  print('isRaining имеет тип: ${isRaining.runtimeType}'); // bool
}
